using Languages
using Base.Test

@testset "wordlists $lang" for lang = [Languages.English, Languages.English()]
  @test all(articles(lang) .== ["a", "an", "the"])
  @test all(indefinite_articles(lang) .== ["a", "an"])
  @test all(definite_articles(lang) .== ["the"])
  @test length(prepositions(lang)) == 33
  @test length(pronouns(lang)) == 36
  @test length(stopwords(lang)) == 488
end

@test Languages.from_code("ben") == Languages.Bengali()
@test Languages.from_code("Ben") == Languages.Bengali()
@test Languages.from_code("BEn") == Languages.Bengali()

@test Languages.from_code("abc") == nothing

include("whatlang.jl")
