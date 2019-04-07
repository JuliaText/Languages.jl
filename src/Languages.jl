module Languages
using JSON
using InteractiveUtils

	export Language
	export isocode, name, detect
	export articles, definite_articles, indefinite_articles
	export prepositions
	export pronouns
	export stopwords
	export LanguageDetector
	export list_languages

	cache = Dict()

	include("types.jl")
	include("utils.jl")
	include("word_lists.jl")
	include("whatlang.jl")

	function __init__()
	    trigram_models_json = JSON.parse(read(joinpath(dirname(@__FILE__), "..", "data", "data.json"), String))
	    global trigram_models = Dict{String, Dict}()
	    for (script, langs) in trigram_models_json
	        for (lang, trigrams) in langs #store only supported langs
				if from_code(lang) != nothing
	            	get!(trigram_models, script, Dict{String, Vector{String}}())[lang] = split(trigrams, '|')
	        	end
	    	end
		end
	end

	## Deprecations
	@Base.deprecate_binding EnglishLanguage English
	@Base.deprecate_binding GermanLanguage German

end
