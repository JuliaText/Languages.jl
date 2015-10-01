for f in ("articles", "indefinite_articles", "definite_articles", "prepositions", "pronouns", "stopwords")
  @eval begin
    function $(Symbol(f)){T <: Language}(l::Type{T})
      filename = Pkg.dir("Languages", "data", $f, string(string(l.name.name), ".txt"))
      return fetch_word_list(filename)
    end
  end
end
