using Languages

@assert all(articles(EnglishLanguage) .== ["a", "an", "the"])
@assert all(indefinite_articles(EnglishLanguage) .== ["a", "an"])
@assert all(definite_articles(EnglishLanguage) .== ["the"])
@assert length(prepositions(EnglishLanguage)) == 33
@assert length(pronouns(EnglishLanguage)) == 36
@assert length(stopwords(EnglishLanguage)) == 488
