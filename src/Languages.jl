require("pkg")

module Languages
	export Language, EnglishLanguage, SpanishLanguage, GermanLanguage
	export articles, definite_articles, indefinite_articles
	export prepositions
	export pronouns
	export stopwords

	cache = Dict()

	require("Languages/src/types.jl")
	require("Languages/src/utils.jl")
	require("Languages/src/word_lists.jl")
end
