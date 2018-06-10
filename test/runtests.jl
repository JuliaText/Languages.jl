using Languages
using Base.Test

@assert all(articles(Languages.English) .== ["a", "an", "the"])
@assert all(indefinite_articles(Languages.English) .== ["a", "an"])
@assert all(definite_articles(Languages.English) .== ["the"])
@assert length(prepositions(Languages.English)) == 33
@assert length(pronouns(Languages.English)) == 36
@assert length(stopwords(Languages.English)) == 488

@test Languages.from_code("ben") == Languages.Bengali()
@test Languages.from_code("Ben") == Languages.Bengali()
@test Languages.from_code("BEn") == Languages.Bengali()

@test Languages.from_code("abc") == nothing

include("whatlang.jl")
