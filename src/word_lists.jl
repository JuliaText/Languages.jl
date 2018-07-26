for f in ("articles", "indefinite_articles", "definite_articles", "prepositions", "pronouns", "stopwords")
  @eval begin
    function $(Symbol(f))(l::Type{T}) where T <: Language
      filename = Pkg.dir("Languages", "data", $f, string(string(l.name.name), ".txt"))
      return fetch_word_list(filename)
    end

    $(Symbol(f))(l::T) where T <: Language = $(Symbol(f))(T)
  end
end
