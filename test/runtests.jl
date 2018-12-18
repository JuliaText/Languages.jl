using Languages
using Test
using JSON

@testset "Languages Tests" begin

lang = Languages.English()

@testset "wordlists $lang" begin
  @test all(articles(lang) .== ["a", "an", "the"])
  @test all(indefinite_articles(lang) .== ["a", "an"])
  @test all(definite_articles(lang) .== ["the"])
  @test length(prepositions(lang)) == 33
  @test length(pronouns(lang)) == 36
  @test length(stopwords(lang)) == 488
end

lang = Languages.Romanian()

@testset "wordlists $lang" begin
  @test all(articles(lang) .== ["a", "aceea", "aceia", "acel", "ai", "ale",
                                "aoalea", "cea", "cei", "cel", "cele",
                                "lui", "nişte", "o", "un", "unei", "unor",
                                "unui", "unul"])
  @test all(indefinite_articles(lang) .== ["lui", "nişte", "o", "un", "unei",
                                           "unor", "unui", "unul"])
  # Test that all indefinite articles are present in the articles
  @test all(map(article->in(article, articles(lang)),
                indefinite_articles(lang)))
  @test isempty(definite_articles(lang))
  @test length(prepositions(lang)) == 19
  @test length(pronouns(lang)) == 257
  @test length(stopwords(lang)) == 101
end

lang = Languages.French()

@testset "wordlists $lang" begin
  @test all(articles(lang) .== ["au", "aux", "de l'", "de la", "des",
                                "du", "la", "le", "les", "un", "une",
                                "à la"])
  @test all(indefinite_articles(lang) .== ["des", "un", "une"])
  # Test that all definite, indefinite articles are present in the articles
  @test all(definite_articles(lang) .== ["la", "le", "les"])
  @test all(map(article->in(article, articles(lang)),
                definite_articles(lang)))
  @test all(map(article->in(article, articles(lang)),
                indefinite_articles(lang)))
  @test length(prepositions(lang)) == 259
  @test length(pronouns(lang)) == 122
  @test length(stopwords(lang)) == 689
end




@testset "lang code" begin
    @test Languages.from_code("ben") == Languages.Bengali()
    @test Languages.from_code("Ben") == Languages.Bengali()
    @test Languages.from_code("BEn") == Languages.Bengali()

    @test Languages.from_code("abc") == nothing
end

@testset "lang detect" begin
    include("whatlang.jl")
end

end
