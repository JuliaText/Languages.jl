const _cache = Dict{AbstractString,Array}()

function fetch_word_list(filename::AbstractString)
  haskey(_cache, filename) && return _cache[filename]
  try
    io = open(filename, "r")
    words = map(x -> chomp(x), readlines(io))
    close(io)
    ret = convert(Array{String,1}, words)
    _cache[filename] = ret
    return ret
  catch
    error("Failed to fetch word list from $(filename)")
  end
end

"""
    list_languages()
This returns information about all the supported languages.
"""
function list_languages()
   [isocode(i) for i in subtypes(Language)]
end
