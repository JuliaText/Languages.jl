#WhatLang tests

# stop chars
@test Languages.is_stop_char(' ')
@test Languages.is_stop_char(',')
@test Languages.is_stop_char('-')
@test Languages.is_stop_char('-')
@test Languages.is_stop_char('9')
@test Languages.is_stop_char('0')

# non-stop chars
@test !Languages.is_stop_char('a')
@test !Languages.is_stop_char('z')
@test !Languages.is_stop_char('A') # latin A
@test !Languages.is_stop_char('Z')
@test !Languages.is_stop_char('я')
@test !Languages.is_stop_char('А') # cyrillic A

@test Languages.is_script(Languages.LatinScript(), 'z') == true
@test Languages.is_script(Languages.LatinScript(), 'A') == true
@test Languages.is_script(Languages.LatinScript(), 'č') == true
@test Languages.is_script(Languages.LatinScript(), 'š') == true
@test Languages.is_script(Languages.LatinScript(), 'Ĵ') == true

@test Languages.is_script(Languages.LatinScript(), 'ж') == false
@test Languages.is_script(Languages.LatinScript(), 'z') == true
@test Languages.is_script(Languages.LatinScript(), 'A') == true
@test Languages.is_script(Languages.LatinScript(), 'č') == true
@test Languages.is_script(Languages.LatinScript(), 'š') == true
@test Languages.is_script(Languages.LatinScript(), 'Ĵ') == true

@test Languages.is_script(Languages.LatinScript(), 'ж') == false

@test Languages.is_script(Languages.EthiopicScript(), 'ፚ') == true
@test Languages.is_script(Languages.EthiopicScript(), 'ᎀ') == true

@test Languages.is_script(Languages.EthiopicScript(), 'а') == false
@test Languages.is_script(Languages.EthiopicScript(), 'L') == false

@test Languages.is_script(Languages.BengaliScript(), 'ই') == true
@test Languages.is_script(Languages.BengaliScript(), 'z') == false

@test Languages.is_script(Languages.KatakanaScript(), 'カ') == true
@test Languages.is_script(Languages.KatakanaScript(), 'f') == false

@test Languages.is_script(Languages.HangulScript(), 'ᄁ') == true
@test Languages.is_script(Languages.HangulScript(), 't') == false

@test Languages.is_script(Languages.GreekScript(), 'φ') == true
@test Languages.is_script(Languages.GreekScript(), 'ф') == false

@test Languages.is_script(Languages.KannadaScript(), 'ಡ') == true
@test Languages.is_script(Languages.KannadaScript(), 'S') == false

@test Languages.is_script(Languages.TamilScript(), 'ஐ') == true
@test Languages.is_script(Languages.TamilScript(), 'Ж') == false

@test Languages.is_script(Languages.ThaiScript(), 'ก') == true
@test Languages.is_script(Languages.ThaiScript(), '๛') == true
@test Languages.is_script(Languages.ThaiScript(), 'Ж') == false

@test Languages.is_script(Languages.GujaratiScript(), 'ઁ') == true
@test Languages.is_script(Languages.GujaratiScript(), '૱') == true
@test Languages.is_script(Languages.GujaratiScript(), 'Ж') == false

@test Languages.is_script(Languages.GurmukhiScript(), 'ਁ') == true
@test Languages.is_script(Languages.GurmukhiScript(), 'ੴ') == true
@test Languages.is_script(Languages.GurmukhiScript(), 'Ж') == false

@test Languages.is_script(Languages.TeluguScript(), 'ఁ') == true
@test Languages.is_script(Languages.TeluguScript(), '౿') == true
@test Languages.is_script(Languages.TeluguScript(), 'Ж') == false

@test Languages.is_script(Languages.OriyaScript(), 'ଐ') == true
@test Languages.is_script(Languages.OriyaScript(), '୷') == true
@test Languages.is_script(Languages.OriyaScript(), '౿') == false

function test_valuable_trigram_chars(chars)
    for ch in chars
        @test Languages.to_trigram_char(ch) == ch
    end
end

function test_not_valuable_trigram_chars(chars)
    for ch in chars
        @test Languages.to_trigram_char(ch) == ' '
    end
end

test_valuable_trigram_chars(['a', 'z', 'A', 'Z', 'Ж', 'ß'])
test_not_valuable_trigram_chars(['\t', '\n', ' ', '.', '0', '9', ',', '@'])
# 0x5B - 0x60
test_not_valuable_trigram_chars(['[', ']', '^', '\\', '`'])
# 0x7B - 0x7E
test_not_valuable_trigram_chars(['[', '|', '{', '}', '~'])

function test_count(text::String,  pairs::Array)
     result = Languages.count_trigrams(text);
     for (trigram, expected_n) in pairs
         actual_n = result[trigram];
         @test actual_n == expected_n
     end
     @test length(result) == length(pairs)
 end

 test_count("", [])
 test_count(",", [])
 test_count("a", [(" a ", 1)])
 test_count("-a-", [(" a ", 1)])
 test_count("yes", [(" ye", 1), ("yes", 1), ("es ", 1)])
 test_count("Give - IT...", [(" gi", 1), ("giv", 1), ("ive", 1), ("ve ", 1), (" it", 1), ("it ", 1)])

res = Languages.get_trigrams_with_positions("xaaaaabbbbd")
@test res["aaa"] == 1
@test res["bbb"] == 2

#Detection
d = LanguageDetector()
text = "Además de todo lo anteriormente dicho, también encontramos..."
output = d(text)
@test output[1] == Languages.Spanish()
@test output[2] == Languages.LatinScript()

text = "Та нічого, все нормально. А в тебе як?"
global output = d(text)
@test output[1] == Languages.Ukrainian()
@test output[2] == Languages.CyrillicScript()

text = "I am begging pardon";
global output = d(text)
@test output[1] == Languages.Tagalog()

text = """
        Мой дядя самых честных правил,
        Когда не в шутку занемог,
        Он уважать себя заставил
        И лучше выдумать не мог.
    """

global output = d(text)
@test output[1] == Languages.Russian()

#Test all languages!
examples = JSON.parse(read(joinpath(dirname(@__FILE__), "examples.json"), String))
d(examples["deu"])

for (key, val) in examples
    global output = d(val)
    @test output[1] == Languages.from_code(key)
end
