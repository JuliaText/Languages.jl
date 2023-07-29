module Languages
using JSON
using InteractiveUtils
using RelocatableFolders

	export Language
	export english_name, isocode, name, detect
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

    const DATA_PATH = @path joinpath(@__DIR__, "..", "data", "data.json")

	function __init__()
	    trigram_models_json = JSON.parse(read(DATA_PATH, String))
	    global trigram_models = Dict{String, Dict}()
	    for (script, langs) in trigram_models_json
	        for (lang, trigrams) in langs #store only supported langs
				if !isnothing(from_code(lang))
	            	get!(trigram_models, script, Dict{String, Vector{String}}())[lang] = split(trigrams, '|')
	        	end
	    	end
		end
	end

	## Deprecations
	@Base.deprecate_binding EnglishLanguage English
	@Base.deprecate_binding GermanLanguage German

end
