function fetch_word_list(filename::String)
  try
    io = open(filename, "r")
    words = map(x -> chomp(x), readlines(io))
    close(io)
    return convert(Array{UTF8String,1}, words)
  catch
    error("Failed to fetch word list from $(filename)")
  end
end
