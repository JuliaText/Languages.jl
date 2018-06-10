abstract type Language; end

# Languages currently supported by Snowball
#Danish, Dutch, English, Finnish, French, German, Hungarian, Italian, Norwegian,
# Portuguese, Romanian, Russian, Spanish, Swedish, Turkish

# These are ISO 639-2T alpha-3 and ISO 639-3 codes
isocode(lang::T) where {T<:Language} = isocode(T)
name(lang::T) where {T<:Language} = name(T)
english_name(lang::T) where {T<:Language} = english_name(T)

struct Esperanto <: Language; end;	english_name(::Type{Esperanto}) = "Esperanto";	name(::Type{Esperanto}) = "Esperanto";	isocode(::Type{Esperanto}) = "epo";
struct English <: Language; end;	english_name(::Type{English}) = "English";	name(::Type{English}) = "English";	isocode(::Type{English}) = "eng"
struct Russian <: Language; end;	english_name(::Type{Russian}) = "Russian";	name(::Type{Russian}) = "Русский";	isocode(::Type{Russian}) = "rus"
struct Mandarin <: Language; end;	english_name(::Type{Mandarin}) = "Mandarin";	name(::Type{Mandarin}) = "官话";	isocode(::Type{Mandarin}) = "cmn"
struct Spanish <: Language; end;	english_name(::Type{Spanish}) = "Spanish";	name(::Type{Spanish}) = "Español";	isocode(::Type{Spanish}) = "spa"
struct Portuguese <: Language; end;	english_name(::Type{Portuguese}) = "Portuguese";	name(::Type{Portuguese}) = "Português";	isocode(::Type{Portuguese}) = "por"
struct Italian <: Language; end;	english_name(::Type{Italian}) = "Italian";	name(::Type{Italian}) = "Italiano";	isocode(::Type{Italian}) = "ita"
struct Bengali <: Language; end;	english_name(::Type{Bengali}) = "Bengali";	name(::Type{Bengali}) = "বাংলা";	isocode(::Type{Bengali}) = "ben"
struct French <: Language; end;	english_name(::Type{French}) = "French";	name(::Type{French}) = "Français";	isocode(::Type{French}) = "fra"
struct German <: Language; end;	english_name(::Type{German}) = "German";	name(::Type{German}) = "Deutsch";	isocode(::Type{German}) = "deu"
struct Ukrainian <: Language; end;	english_name(::Type{Ukrainian}) = "Ukrainian";	name(::Type{Ukrainian}) = "Українська";	isocode(::Type{Ukrainian}) = "ukr"
struct Georgian <: Language; end;	english_name(::Type{Georgian}) = "Georgian";	name(::Type{Georgian}) = "ქართული";	isocode(::Type{Georgian}) = "kat"
struct Arabic <: Language; end;	english_name(::Type{Arabic}) = "Arabic";	name(::Type{Arabic}) = "العربية";	isocode(::Type{Arabic}) = "arb"
struct Hindi <: Language; end;	english_name(::Type{Hindi}) = "Hindi";	name(::Type{Hindi}) = "हिन्दी";	isocode(::Type{Hindi}) = "hin"
struct Japanese <: Language; end;	english_name(::Type{Japanese}) = "Japanese";	name(::Type{Japanese}) = "日本語";	isocode(::Type{Japanese}) = "jpn"
struct Hebrew <: Language; end;	english_name(::Type{Hebrew}) = "Hebrew";	name(::Type{Hebrew}) = "עברית";	isocode(::Type{Hebrew}) = "heb"
struct Yiddish <: Language; end;	english_name(::Type{Yiddish}) = "Yiddish";	name(::Type{Yiddish}) = "ייִדיש";	isocode(::Type{Yiddish}) = "ydd"
struct Polish <: Language; end;	english_name(::Type{Polish}) = "Polish";	name(::Type{Polish}) = "Polski";	isocode(::Type{Polish}) = "pol"
struct Amharic <: Language; end;	english_name(::Type{Amharic}) = "Amharic";	name(::Type{Amharic}) = "አማርኛ";	isocode(::Type{Amharic}) = "amh"
struct Tigrinya <: Language; end;	english_name(::Type{Tigrinya}) = "Tigrinya";	name(::Type{Tigrinya}) = "ትግርኛ";	isocode(::Type{Tigrinya}) = "tir"
struct Javanese <: Language; end;	english_name(::Type{Javanese}) = "Javanese";	name(::Type{Javanese}) = "Basa Jawa";	isocode(::Type{Javanese}) = "jav"
struct Korean <: Language; end;	english_name(::Type{Korean}) = "Korean";	name(::Type{Korean}) = "한국어";	isocode(::Type{Korean}) = "kor"
struct Bokmal <: Language; end;	english_name(::Type{Bokmal}) = "Bokmal";	name(::Type{Bokmal}) = "Bokmål";	isocode(::Type{Bokmal}) = "nob"
struct Nynorsk <: Language; end;	english_name(::Type{Nynorsk}) = "Nynorsk";	name(::Type{Nynorsk}) = "Nynorsk";	isocode(::Type{Nynorsk}) = "nno"
struct Danish <: Language; end;	english_name(::Type{Danish}) = "Danish";	name(::Type{Danish}) = "Dansk";	isocode(::Type{Danish}) = "dan"
struct Swedish <: Language; end;	english_name(::Type{Swedish}) = "Swedish";	name(::Type{Swedish}) = "Svenska";	isocode(::Type{Swedish}) = "swe"
struct Finnish <: Language; end;	english_name(::Type{Finnish}) = "Finnish";	name(::Type{Finnish}) = "Suomi";	isocode(::Type{Finnish}) = "fin"
struct Turkish <: Language; end;	english_name(::Type{Turkish}) = "Turkish";	name(::Type{Turkish}) = "Türkçe";	isocode(::Type{Turkish}) = "tur"
struct Dutch <: Language; end;	english_name(::Type{Dutch}) = "Dutch";	name(::Type{Dutch}) = "Nederlands";	isocode(::Type{Dutch}) = "nld"
struct Hungarian <: Language; end;	english_name(::Type{Hungarian}) = "Hungarian";	name(::Type{Hungarian}) = "Magyar";	isocode(::Type{Hungarian}) = "hun"
struct Czech <: Language; end;	english_name(::Type{Czech}) = "Czech";	name(::Type{Czech}) = "Čeština";	isocode(::Type{Czech}) = "ces"
struct Greek <: Language; end;	english_name(::Type{Greek}) = "Greek";	name(::Type{Greek}) = "Ελληνικά";	isocode(::Type{Greek}) = "ell"
struct Bulgarian <: Language; end;	english_name(::Type{Bulgarian}) = "Bulgarian";	name(::Type{Bulgarian}) = "Български";	isocode(::Type{Bulgarian}) = "bul"
struct Belarusian <: Language; end;	english_name(::Type{Belarusian}) = "Belarusian";	name(::Type{Belarusian}) = "Беларуская";	isocode(::Type{Belarusian}) = "bel"
struct Marathi <: Language; end;	english_name(::Type{Marathi}) = "Marathi";	name(::Type{Marathi}) = "मराठी";	isocode(::Type{Marathi}) = "mar"
struct Kannada <: Language; end;	english_name(::Type{Kannada}) = "Kannada";	name(::Type{Kannada}) = "ಕನ್ನಡ";	isocode(::Type{Kannada}) = "kan"
struct Romanian <: Language; end;	english_name(::Type{Romanian}) = "Romanian";	name(::Type{Romanian}) = "Română";	isocode(::Type{Romanian}) = "ron"
struct Slovene <: Language; end;	english_name(::Type{Slovene}) = "Slovene";	name(::Type{Slovene}) = "Slovenščina";	isocode(::Type{Slovene}) = "slv"
struct Croatian <: Language; end;	english_name(::Type{Croatian}) = "Croatian";	name(::Type{Croatian}) = "Hrvatski";	isocode(::Type{Croatian}) = "hrv"
struct Serbian <: Language; end;	english_name(::Type{Serbian}) = "Serbian";	name(::Type{Serbian}) = "Српски";	isocode(::Type{Serbian}) = "srp"
struct Macedonian <: Language; end;	english_name(::Type{Macedonian}) = "Macedonian";	name(::Type{Macedonian}) = "Македонски";	isocode(::Type{Macedonian}) = "mkd"
struct Lithuanian <: Language; end;	english_name(::Type{Lithuanian}) = "Lithuanian";	name(::Type{Lithuanian}) = "Lietuvių";	isocode(::Type{Lithuanian}) = "lit"
struct Latvian <: Language; end;	english_name(::Type{Latvian}) = "Latvian";	name(::Type{Latvian}) = "Latviešu";	isocode(::Type{Latvian}) = "lav"
struct Estonian <: Language; end;	english_name(::Type{Estonian}) = "Estonian";	name(::Type{Estonian}) = "Eesti";	isocode(::Type{Estonian}) = "est"
struct Tamil <: Language; end;	english_name(::Type{Tamil}) = "Tamil";	name(::Type{Tamil}) = "தமிழ்";	isocode(::Type{Tamil}) = "tam"
struct Vietnamese <: Language; end;	english_name(::Type{Vietnamese}) = "Vietnamese";	name(::Type{Vietnamese}) = "Tiếng Việt";	isocode(::Type{Vietnamese}) = "vie"
struct Urdu <: Language; end;	english_name(::Type{Urdu}) = "Urdu";	name(::Type{Urdu}) = "اُردُو";	isocode(::Type{Urdu}) = "urd"
struct Thai <: Language; end;	english_name(::Type{Thai}) = "Thai";	name(::Type{Thai}) = "ภาษาไทย";	isocode(::Type{Thai}) = "tha"
struct Gujarati <: Language; end;	english_name(::Type{Gujarati}) = "Gujarati";	name(::Type{Gujarati}) = "ગુજરાતી";	isocode(::Type{Gujarati}) = "guj"
struct Uzbek <: Language; end;	english_name(::Type{Uzbek}) = "Uzbek";	name(::Type{Uzbek}) = "Oʻzbekcha";	isocode(::Type{Uzbek}) = "uzb"
struct Punjabi <: Language; end;	english_name(::Type{Punjabi}) = "Punjabi";	name(::Type{Punjabi}) = "ਪੰਜਾਬੀ";	isocode(::Type{Punjabi}) = "pan"
struct Azerbaijani <: Language; end;	english_name(::Type{Azerbaijani}) = "Azerbaijani";	name(::Type{Azerbaijani}) = "Azərbaycanca";	isocode(::Type{Azerbaijani}) = "azj"
struct Indonesian <: Language; end;	english_name(::Type{Indonesian}) = "Indonesian";	name(::Type{Indonesian}) = "Bahasa Indonesia";	isocode(::Type{Indonesian}) = "ind"
struct Telugu <: Language; end;	english_name(::Type{Telugu}) = "Telugu";	name(::Type{Telugu}) = "తెలుగు";	isocode(::Type{Telugu}) = "tel"
struct Persian <: Language; end;	english_name(::Type{Persian}) = "Persian";	name(::Type{Persian}) = "فارسی";	isocode(::Type{Persian}) = "pes"
struct Malayalam <: Language; end;	english_name(::Type{Malayalam}) = "Malayalam";	name(::Type{Malayalam}) = "മലയാളം";	isocode(::Type{Malayalam}) = "mal"
struct Hausa <: Language; end;	english_name(::Type{Hausa}) = "Hausa";	name(::Type{Hausa}) = "Hausa";	isocode(::Type{Hausa}) = "hau"
struct Oriya <: Language; end;	english_name(::Type{Oriya}) = "Oriya";	name(::Type{Oriya}) = "ଓଡ଼ିଆ";	isocode(::Type{Oriya}) = "ori"
struct Burmese <: Language; end;	english_name(::Type{Burmese}) = "Burmese";	name(::Type{Burmese}) = "မြန်မာစာ";	isocode(::Type{Burmese}) = "mya"
struct Bhojpuri <: Language; end;	english_name(::Type{Bhojpuri}) = "Bhojpuri";	name(::Type{Bhojpuri}) = "भोजपुरी";	isocode(::Type{Bhojpuri}) = "bho"
struct Tagalog <: Language; end;	english_name(::Type{Tagalog}) = "Tagalog";	name(::Type{Tagalog}) = "Tagalog";	isocode(::Type{Tagalog}) = "tgl"
struct Yoruba <: Language; end;	english_name(::Type{Yoruba}) = "Yoruba";	name(::Type{Yoruba}) = "Yorùbá";	isocode(::Type{Yoruba}) = "yor"
struct Maithili <: Language; end;	english_name(::Type{Maithili}) = "Maithili";	name(::Type{Maithili}) = "मैथिली";	isocode(::Type{Maithili}) = "mai"
struct Oromo <: Language; end;	english_name(::Type{Oromo}) = "Oromo";	name(::Type{Oromo}) = "Oromoo";	isocode(::Type{Oromo}) = "orm"
struct Igbo <: Language; end;	english_name(::Type{Igbo}) = "Igbo";	name(::Type{Igbo}) = "Igbo";	isocode(::Type{Igbo}) = "ibo"
struct Cebuano <: Language; end;	english_name(::Type{Cebuano}) = "Cebuano";	name(::Type{Cebuano}) = "Cebuano";	isocode(::Type{Cebuano}) = "ceb"
struct Kurdish <: Language; end;	english_name(::Type{Kurdish}) = "Kurdish";	name(::Type{Kurdish}) = "Kurdî";	isocode(::Type{Kurdish}) = "kur"
struct Malagasy <: Language; end;	english_name(::Type{Malagasy}) = "Malagasy";	name(::Type{Malagasy}) = "Malagasy";	isocode(::Type{Malagasy}) = "mlg"
struct Saraiki <: Language; end;	english_name(::Type{Saraiki}) = "Saraiki";	name(::Type{Saraiki}) = "سرائیکی";	isocode(::Type{Saraiki}) = "skr"
struct Nepali <: Language; end;	english_name(::Type{Nepali}) = "Nepali";	name(::Type{Nepali}) = "नेपाली";	isocode(::Type{Nepali}) = "nep"
struct Sinhalese <: Language; end;	english_name(::Type{Sinhalese}) = "Sinhalese";	name(::Type{Sinhalese}) = "සිංහල";	isocode(::Type{Sinhalese}) = "sin"
struct Khmer <: Language; end;	english_name(::Type{Khmer}) = "Khmer";	name(::Type{Khmer}) = "ភាសាខ្មែរ";	isocode(::Type{Khmer}) = "khm"
struct Turkmen <: Language; end;	english_name(::Type{Turkmen}) = "Turkmen";	name(::Type{Turkmen}) = "Türkmençe";	isocode(::Type{Turkmen}) = "tuk"
struct Somali <: Language; end;	english_name(::Type{Somali}) = "Somali";	name(::Type{Somali}) = "Soomaaliga";	isocode(::Type{Somali}) = "som"
struct Chewa <: Language; end;	english_name(::Type{Chewa}) = "Chewa";	name(::Type{Chewa}) = "Chichewa";	isocode(::Type{Chewa}) = "nya"
struct Akan <: Language; end;	english_name(::Type{Akan}) = "Akan";	name(::Type{Akan}) = "Akan";	isocode(::Type{Akan}) = "aka"
struct Zulu <: Language; end;	english_name(::Type{Zulu}) = "Zulu";	name(::Type{Zulu}) = "IsiZulu";	isocode(::Type{Zulu}) = "zul"
struct Kinyarwanda <: Language; end;	english_name(::Type{Kinyarwanda}) = "Kinyarwanda";	name(::Type{Kinyarwanda}) = "Kinyarwanda";	isocode(::Type{Kinyarwanda}) = "kin"
struct HaitianCreole <: Language; end;	english_name(::Type{HaitianCreole}) = "HaitianCreole";	name(::Type{HaitianCreole}) = "Kreyòl ayisyen";	isocode(::Type{HaitianCreole}) = "hat"
struct Ilocano <: Language; end;	english_name(::Type{Ilocano}) = "Ilocano";	name(::Type{Ilocano}) = "Ilokano";	isocode(::Type{Ilocano}) = "ilo"
struct Rundi <: Language; end;	english_name(::Type{Rundi}) = "Rundi";	name(::Type{Rundi}) = "Ikirundi";	isocode(::Type{Rundi}) = "run"
struct Shona <: Language; end;	english_name(::Type{Shona}) = "Shona";	name(::Type{Shona}) = "ChiShona";	isocode(::Type{Shona}) = "sna"
struct Uyghur <: Language; end;	english_name(::Type{Uyghur}) = "Uyghur";	name(::Type{Uyghur}) = "ئۇيغۇرچە";	isocode(::Type{Uyghur}) = "uig"
struct Swahili <: Language; end;	english_name(::Type{Swahili}) = "Swahili";	name(::Type{Swahili}) = "Kiswahili";	isocode(::Type{Swahili}) = "swh"

global const code_to_lang = Dict{String, Language}(
    "epo"  => Esperanto(),
    "eng"  => English(),
    "rus"  => Russian(),
    "cmn"  => Mandarin(),
    "spa"  => Spanish(),
    "por"  => Portuguese(),
    "ita"  => Italian(),
    "ben"  => Bengali(),
    "fra"  => French(),
    "deu"  => German(),
    "ukr"  => Ukrainian(),
    "kat"  => Georgian(),
    "arb"  => Arabic(),
    "hin"  => Hindi(),
    "jpn"  => Japanese(),
    "heb"  => Hebrew(),
    "ydd"  => Yiddish(),
    "pol"  => Polish(),
    "amh"  => Amharic(),
    "tir"  => Tigrinya(),
    "jav"  => Javanese(),
    "kor"  => Korean(),
    "nob"  => Bokmal(),
    "nno"  => Nynorsk(),
    "dan"  => Danish(),
    "swe"  => Swedish(),
    "fin"  => Finnish(),
    "tur"  => Turkish(),
    "nld"  => Dutch(),
    "hun"  => Hungarian(),
    "ces"  => Czech(),
    "ell"  => Greek(),
    "bul"  => Bulgarian(),
    "bel"  => Belarusian(),
    "mar"  => Marathi(),
    "kan"  => Kannada(),
    "ron"  => Romanian(),
    "slv"  => Slovene(),
    "hrv"  => Croatian(),
    "srp"  => Serbian(),
    "mkd"  => Macedonian(),
    "lit"  => Lithuanian(),
    "lav"  => Latvian(),
    "est"  => Estonian(),
    "tam"  => Tamil(),
    "vie"  => Vietnamese(),
    "urd"  => Urdu(),
    "tha"  => Thai(),
    "guj"  => Gujarati(),
    "uzb"  => Uzbek(),
    "pan"  => Punjabi(),
    "azj"  => Azerbaijani(),
    "ind"  => Indonesian(),
    "tel"  => Telugu(),
    "pes"  => Persian(),
    "mal"  => Malayalam(),
    "hau"  => Hausa(),
    "ori"  => Oriya(),
    "mya"  => Burmese(),
    "bho"  => Bhojpuri(),
    "tgl"  => Tagalog(),
    "yor"  => Yoruba(),
    "mai"  => Maithili(),
    "orm"  => Oromo(),
    "ibo"  => Igbo(),
    "ceb"  => Cebuano(),
    "kur"  => Kurdish(),
    "mlg"  => Malagasy(),
    "skr"  => Saraiki(),
    "nep"  => Nepali(),
    "sin"  => Sinhalese(),
    "khm"  => Khmer(),
    "tuk"  => Turkmen(),
    "som"  => Somali(),
    "nya"  => Chewa(),
    "aka"  => Akan(),
    "zul"  => Zulu(),
    "kin"  => Kinyarwanda(),
    "hat"  => HaitianCreole(),
    "ilo"  => Ilocano(),
    "run"  => Rundi(),
    "sna"  => Shona(),
    "uig"  => Uyghur(),
    )

function from_code(code::String)
    return get(code_to_lang, lowercase(code), nothing)
end

abstract type Script; end

struct ArabicScript <: Script; end
struct BengaliScript <: Script; end
struct CyrillicScript <: Script; end
struct DevanagariScript <: Script; end
struct EthiopicScript <: Script; end
struct GeorgianScript <: Script; end
struct GreekScript <: Script; end
struct GujaratiScript <: Script; end
struct GurmukhiScript <: Script; end
struct HangulScript <: Script; end
struct HebrewScript <: Script; end
struct HiraganaScript <: Script; end
struct KannadaScript <: Script; end
struct KatakanaScript <: Script; end
struct KhmerScript <: Script; end
struct LatinScript <: Script; end
struct MalayalamScript <: Script; end
struct MandarinScript <: Script; end
struct MyanmarScript <: Script; end
struct OriyaScript <: Script; end
struct SinhalaScript <: Script; end
struct TamilScript <: Script; end
struct TeluguScript <: Script; end
struct ThaiScript <: Script; end

name(::ArabicScript) = "Arabic"
name(::BengaliScript) = "Bengali"
name(::CyrillicScript) = "Cyrillic"
name(::DevanagariScript) = "Devanagari"
name(::EthiopicScript) = "Ethiopic"
name(::GeorgianScript) = "Georgian"
name(::GreekScript) = "Greek"
name(::GujaratiScript) = "Gujarati"
name(::GurmukhiScript) = "Gurmukhi"
name(::HangulScript) = "Hangul"
name(::HebrewScript) = "Hebrew"
name(::HiraganaScript) = "Hiragana"
name(::KannadaScript) = "Kannada"
name(::KatakanaScript) = "Katakana"
name(::KhmerScript) = "Khmer"
name(::LatinScript) = "Latin"
name(::MalayalamScript) = "Malayalam"
name(::MandarinScript) = "Mandarin"
name(::MyanmarScript) = "Myanmar"
name(::OriyaScript) = "Oriya"
name(::SinhalaScript) = "Sinhala"
name(::TamilScript) = "Tamil"
name(::TeluguScript) = "Telugu"
name(::ThaiScript) = "Thai"
