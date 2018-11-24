# Maximum distance(difference) for a trigram in a language profile and text profile.
 const MAX_TRIGRAM_DISTANCE = 300;

# 300 trigrams where each has MAX_TOTAL_DISTANCE=300, gives us 90_000.
 const MAX_TOTAL_DISTANCE = 90_000;

# Double MAX_TRIGRAM_DISTANCE
 const TEXT_TRIGRAMS_SIZE = 600;

const RELIABLE_CONFIDENCE_THRESHOLD = 0.8;

function detect_script(text::AbstractString)
    script_counters = [
      [LatinScript()      , 0],
      [CyrillicScript()   , 0],
      [ArabicScript()     , 0],
      [MandarinScript()   , 0],
      [DevanagariScript() , 0],
      [HebrewScript()     , 0],
      [EthiopicScript()   , 0],
      [GeorgianScript()   , 0],
      [BengaliScript()    , 0],
      [HangulScript()     , 0],
      [HiraganaScript()   , 0],
      [KatakanaScript()   , 0],
      [GreekScript()      , 0],
      [KannadaScript()    , 0],
      [TamilScript()      , 0],
      [ThaiScript()       , 0],
      [GujaratiScript()   , 0],
      [GurmukhiScript()   , 0],
      [TeluguScript()     , 0],
      [MalayalamScript()  , 0],
      [OriyaScript()      , 0],
      [MyanmarScript()    , 0],
      [SinhalaScript()    , 0],
      [KhmerScript()      , 0]
    ]

    half = length(text) / 2
    local found
    for ch in text
        if is_stop_char(ch); continue; end
        for i in 1:length(script_counters)
            (script, count) = script_counters[i]
            found = false
            if is_script(script, ch)
                script_counters[i][2] += 1
                found=true
                if script_counters[i][2] > half; return script; end
            end
            # If script was found, move it closer to the front.
            # If the text contains largely 1 or 2 scripts, this will
            # cause these scripts to be eventually checked first.
            if found && i>1
                t=script_counters[i-1]
                script_counters[i-1] = script_counters[i]
                script_counters[i] = t
            end
        end
    end

    sort!(script_counters, lt=(x,y)->x[2]<y[2])
    if script_counters[1][2] > 0
        return script_counters[1][2]
    else
        return nothing
    end


end

function is_script(::CyrillicScript, ch::Char)
   return ch in '\u0400':'\u0484' || ch in '\u0487':'\u052F' || ch in '\u2DE0':'\u2DFF' || ch in '\uA640':'\uA69D' || ch == '\u1D2B' || ch == '\u1D78' || ch == '\uA69F'
end

# https:#en.wikipedia.org/wiki/Latin_script_in_Unicode
function is_script(::LatinScript, ch::Char)
    return ch in 'a':'z' || ch in 'A':'Z' || ch in '\u0080':'\u00FF' || ch in '\u0100':'\u017F' || ch in '\u0180':'\u024F' || ch in '\u0250':'\u02AF' || ch in '\u1D00':'\u1D7F' || ch in '\u1D80':'\u1DBF' || ch in '\u1E00':'\u1EFF' || ch in '\u2100':'\u214F' || ch in '\u2C60':'\u2C7F' || ch in '\uA720':'\uA7FF' || ch in '\uAB30':'\uAB6F'
end

# Based on https:#en.wikipedia.org/wiki/Arabic_script_in_Unicode
function is_script(::ArabicScript, ch::Char)
    return ch in  '\u0600':'\u06FF' || ch in '\u0750':'\u07FF' || ch in '\u08A0':'\u08FF' || ch in '\uFB50':'\uFDFF' || ch in '\uFE70':'\uFEFF' #|| '\u10E60':'\u10E7F' || '\u1EE00':'\u1EEFF'
end

# Based on https:#en.wikipedia.org/wiki/Devanagari#Unicode
function is_script(::DevanagariScript, ch::Char)
    return ch in '\u0900':'\u097F' || ch in '\uA8E0':'\uA8FF' || ch in '\u1CD0':'\u1CFF'
end

# Based on https:#www.key-shortcut.com/en/writing-systems/ethiopian-script/
function is_script(::EthiopicScript, ch::Char)
    return ch in '\u1200':'\u139F' || ch in '\u2D80':'\u2DDF' || ch in '\uAB00':'\uAB2F'
end

# Based on https:#en.wikipedia.org/wiki/Hebrew_(Unicode_block)
function is_script(::HebrewScript, ch::Char)
    return ch in '\u0590':'\u05FF'
end

function is_script(::GeorgianScript, ch::Char)
   return ch in '\u10A0':'\u10FF'
end

function is_script(::MandarinScript, ch::Char)
    return ch in '\u2E80':'\u2E99' || ch in '\u2E9B':'\u2EF3' || ch in '\u2F00':'\u2FD5' || ch == '\u3005' || ch == '\u3007' || ch in '\u3021':'\u3029' || ch in '\u3038':'\u303B' || ch in '\u3400':'\u4DB5' || ch in '\u4E00':'\u9FCC' || ch in '\uF900':'\uFA6D' || ch in '\uFA70':'\uFAD9'
end

function is_script(::BengaliScript, ch::Char)
   return ch in '\u0980':'\u09FF'
end

function is_script(::HiraganaScript, ch::Char)
   return ch in '\u3040':'\u309F'
end

function is_script(::KatakanaScript, ch::Char)
   return ch in '\u30A0':'\u30FF'
end

# Hangul is Korean Alphabet. Unicode ranges are taken from: https:#en.wikipedia.org/wiki/Hangul
function is_script(::HangulScript, ch::Char)
    return ch in '\uAC00':'\uD7AF' || ch in '\u1100':'\u11FF' || ch in '\u3130':'\u318F' || ch in '\u3200':'\u32FF' || ch in '\uA960':'\uA97F' || ch in '\uD7B0':'\uD7FF' || ch in '\uFF00':'\uFFEF'
end

# Taken from: https:#en.wikipedia.org/wiki/Greek_and_Coptic
function is_script(::GreekScript, ch::Char)
    return ch in '\u0370':'\u03FF'
end

# Based on: https:#en.wikipedia.org/wiki/Kannada_(Unicode_block)
function is_script(::KannadaScript, ch::Char)
    return ch in '\u0C80':'\u0CFF'
end

# Based on: https:#en.wikipedia.org/wiki/Tamil_(Unicode_block)
function is_script(::TamilScript, ch::Char)
    return ch in '\u0B80':'\u0BFF'
end

# Based on: https:#en.wikipedia.org/wiki/Thai_(Unicode_block)
function is_script(::ThaiScript, ch::Char)
    return ch in '\u0E00':'\u0E7F'
end

# Based on: https:#en.wikipedia.org/wiki/Gujarati_(Unicode_block)
function is_script(::GujaratiScript, ch::Char)
    return ch in '\u0A80':'\u0AFF'
end

# Gurmukhi is the script for Punjabi language.
# Based on: https:#en.wikipedia.org/wiki/Gurmukhi_(Unicode_block)
function is_script(::GurmukhiScript, ch::Char)
    return ch in '\u0A00':'\u0A7F'
end

function is_script(::TeluguScript, ch::Char)
    return ch in '\u0C00':'\u0C7F'
end

# Based on: https:#en.wikipedia.org/wiki/Malayalam_(Unicode_block)
function is_script(::MalayalamScript, ch::Char)
    return ch in '\u0D00':'\u0D7F'
end

# Based on: https:#en.wikipedia.org/wiki/Malayalam_(Unicode_block)
function is_script(::OriyaScript, ch::Char)
    return ch in '\u0B00':'\u0B7F'
end

# Based on: https:#en.wikipedia.org/wiki/Myanmar_(Unicode_block)
function is_script(::MyanmarScript, ch::Char)
    return ch in '\u1000':'\u109F'
end

# Based on: https:#en.wikipedia.org/wiki/Sinhala_(Unicode_block)
function is_script(::SinhalaScript, ch::Char)
    return ch in '\u0D80':'\u0DFF'
end

# Based on: https:#en.wikipedia.org/wiki/Khmer_alphabet
function is_script(::KhmerScript, ch::Char)
    return ch in '\u1780':'\u17FF' || ch in '\u19E0':'\u19FF'
end

function is_stop_char(ch::Char)
    return ch in '\u0000':'\u0040' || ch in '\u005B':'\u0060' || ch in '\u007B':'\u007E'
end


### Trigram model

function to_trigram_char(ch::Char)
    if is_stop_char(ch); ' ' ; else ch; end
end

function count_trigrams(text::AbstractString)
    counter_hash  = Dict{String, Int}()
    text = string(text, ' ')
    #iterate through the string and count trigram
    chars_iter = (lowercase(to_trigram_char(x)) for x in text)
    c1 = ' ';
    #state = start(chars_iter)
    next = iterate(chars_iter)
    (c2, state) = next
    #c2, state = next(chars_iter, state)
    next = iterate(chars_iter, state)
    while next != nothing #!done(chars_iter, state)
        #c3, state  = next(chars_iter, state)
        (c3, state) = next
        if !(c2 == ' ' && (c1 == ' ' || c3 == ' '))
            trigram = string(c1, c2, c3)
            counter_hash[trigram] = get(counter_hash, trigram, 0) + 1
        end
        c1 = c2;
        c2 = c3;
        next = iterate(chars_iter, state)
    end
    return counter_hash
end

function get_trigrams_with_positions(text::String)
    count_vec = [(v,k) for (k, v) in count_trigrams(text)]
    sort!(count_vec, rev=true)
    Dict(tri => i for (i, (c, tri)) in enumerate(count_vec[1:min(length(count_vec), TEXT_TRIGRAMS_SIZE)]))
end

detect_lang_based_on_script(text::AbstractString, script::LatinScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::CyrillicScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::DevanagariScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::HebrewScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::EthiopicScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::ArabicScript, options) = detect_lang_trigrams(text, script, options)
detect_lang_based_on_script(text::AbstractString, script::MandarinScript, options) = ("Cmn", 1.0)
detect_lang_based_on_script(text::AbstractString, script::BengaliScript, options) = ("Ben", 1.0)
detect_lang_based_on_script(text::AbstractString, script::HangulScript, options) = ("Kor", 1.0)
detect_lang_based_on_script(text::AbstractString, script::GeorgianScript, options) = ("Kat", 1.0)
detect_lang_based_on_script(text::AbstractString, script::GreekScript, options) = ("Ell", 1.0)
detect_lang_based_on_script(text::AbstractString, script::KannadaScript, options) = ("Kan", 1.0)
detect_lang_based_on_script(text::AbstractString, script::TamilScript, options) = ("Tam", 1.0)
detect_lang_based_on_script(text::AbstractString, script::ThaiScript, options) = ("Tha", 1.0)
detect_lang_based_on_script(text::AbstractString, script::GujaratiScript, options) = ("Guj", 1.0)
detect_lang_based_on_script(text::AbstractString, script::GurmukhiScript, options) = ("Pan", 1.0)
detect_lang_based_on_script(text::AbstractString, script::TeluguScript, options) = ("Tel", 1.0)
detect_lang_based_on_script(text::AbstractString, script::MalayalamScript, options) = ("Mal", 1.0)
detect_lang_based_on_script(text::AbstractString, script::OriyaScript, options) = ("Ori", 1.0)
detect_lang_based_on_script(text::AbstractString, script::MyanmarScript, options) = ("Mya", 1.0)
detect_lang_based_on_script(text::AbstractString, script::SinhalaScript, options) = ("Sin", 1.0)
detect_lang_based_on_script(text::AbstractString, script::KhmerScript, options) = ("Khm", 1.0)
detect_lang_based_on_script(text::AbstractString, script::Union{HiraganaScript, KatakanaScript}, options) = ("Jpn", 1.0)


@enum DetectType Trigram=1 Deep=2

struct LangDetectOptions
    model::DetectType
    whitelist::Union{Nothing, Vector{Language}}
    blacklist::Union{Nothing, Vector{Language}}
end

default_options() = LangDetectOptions(Trigram, Vector{Language}(), Vector{Language}())

detect_lang_trigrams(text::AbstractString, script::Script, options) = detect_lang_trigrams(text, trigram_models[name(script)], options)

function detect_lang_trigrams(text::AbstractString, lang_trigrams_list::Dict{String, Vector{String}}, options )
    lang_distances = Vector{Tuple{String, Int}}()
    trigrams = get_trigrams_with_positions(text)

    for (lang, lang_trigrams) in lang_trigrams_list

        if !isempty(options.whitelist) && !contains(==, options.whitelist, lang); continue; end
        if !isempty(options.blacklist) && contains(==, options.blacklist, lang); continue; end

        dist = calculate_distance(lang_trigrams, trigrams)
        push!(lang_distances, (lang, dist))
    end

    # Sort languages by distance
    sort!(lang_distances, lt=(x, y)->x[2]<y[2])

    # Return None if lang_distances is empty
    if isempty(lang_distances); return (nothing, 0.0); end
    # Return the only language with is_reliable=true if there is only 1 item
    if length(lang_distances) == 1
        return (lang_distances[1][1], 1.0)
    end

    # Calculate is_reliable based on:
    # - number of unique trigrams in the text
    # - rate (diff between score of the first and second languages)
    #
    lang_dist1 = lang_distances[1]
    lang_dist2 = lang_distances[2]
    score1 = MAX_TOTAL_DISTANCE - lang_dist1[2]
    score2 = MAX_TOTAL_DISTANCE - lang_dist2[2]

    if score1 == 0
        # If score1 is 0, score2 is 0 as well, because array is sorted.
        # Therefore there is not language to return.
        return (nothing, 0.0)
    elseif score2 == 0
        # If score2 is 0, return first language, to prevent division by zero in the rate formula.
        # In this case confidence is calculated by another formula.
        # At this point there are two options:
        # * Text contains random characters that accidentally match trigrams of one of the languages
        # * Text really matches one of the languages.
        #
        # Number 500.0 is based on experiments and common sense expectations.
        confidence = score1 / 500.0
        if confidence > 1.0
            confidence = 1.0
        end
        return (lang_dist1[1], confidence)
    end

    rate = (score1 - score2) / score2

    # Hyperbola function. Everything that is above the function has confidence = 1.0
    # If rate is below, confidence is calculated proportionally.
    # Numbers 12.0 and 0.05 are obtained experimentally, so the function represents common sense.
    #
    confident_rate = (12.0 / length(trigrams)) + 0.05
    confidence = (rate > confident_rate) ? 1.0 : rate / confident_rate

    return (lang_dist1[1], confidence)
end


function calculate_distance(lang_trigrams,  text_trigrams)
    total_dist = 0
    for (i, trigram) in enumerate(lang_trigrams)
        dist = get(text_trigrams, trigram, MAX_TRIGRAM_DISTANCE+i) - i
        total_dist += abs(dist)
    end
    total_dist
end

Base.@deprecate detect(text::AbstractString, options=default_options()) LanguageDetector()(text, options)

mutable struct LanguageDetector
end

function(m::LanguageDetector)(text::AbstractString, options=default_options())
    if text==""; throw(ArgumentError("Cannot detect language for empty text")); end
    script = detect_script(text)
    if script == nothing; return (nothing, nothing, 0); end
    lang, conf = detect_lang_based_on_script(text, script, options)
    return (from_code(lang), script, conf)
end
