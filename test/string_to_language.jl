# string_to_language tests

# Test if the constructor is working correctly

@test Language("eng") isa Languages.English
@test Language("por") isa Languages.Portuguese
@test Language("spa") isa Languages.Spanish
@test Language("Thai") isa Languages.Thai
@test Language("Esperanto") isa Languages.Esperanto
@test Language("Uzbek") isa Languages.Uzbek
@test Language("italian") isa Languages.Italian
@test !(Language("spa") isa Languages.English)
@test !(Language("Portuguese") isa Languages.Spanish)
@test !(Language("eng") isa Languages.Portuguese)

# Test all languages
examples = JSON.parse(read(joinpath(dirname(@__FILE__), "examples.json"), String))
for (key, val) in examples
    lang = Languages.from_code(key)
    english_name = Languages.english_name(lang)
    @test Language(key) == lang
    @test Language(english_name) == lang
end
