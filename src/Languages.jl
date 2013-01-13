module Languages
	export Language, EnglishLanguage, SpanishLanguage, GermanLanguage
	export articles, definite_articles, indefinite_articles
	export prepositions
	export pronouns
	export stopwords

	cache = Dict()

	include(joinpath(julia_pkgdir(), "Languages", "src", "types.jl"))
	include(joinpath(julia_pkgdir(), "Languages", "src", "utils.jl"))
	include(joinpath(julia_pkgdir(), "Languages", "src", "word_lists.jl"))
end
