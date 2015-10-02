module Languages
using Compat
	export Language, EnglishLanguage, SpanishLanguage, GermanLanguage
	export isocode, name
	export articles, definite_articles, indefinite_articles
	export prepositions
	export pronouns
	export stopwords

	cache = Dict()

	include("types.jl")
	include("utils.jl")
	include("word_lists.jl")
end
