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
