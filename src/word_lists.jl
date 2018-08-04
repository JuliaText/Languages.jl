for f in ("articles", "indefinite_articles", "definite_articles", "prepositions", "pronouns", "stopwords")
  @eval begin
    function $(Symbol(f)){T <: Language}(l::T)
      filename = Pkg.dir("Languages", "data", $f, Languages.english_name(l)*".txt")
      return fetch_word_list(filename)
    end
  end
end


for f in ("articles", "indefinite_articles", "definite_articles", "prepositions", "pronouns", "stopwords")
  @eval begin
    function $(Symbol(f)){T <: Language}(l::Type{T})
      filename = Pkg.dir("Languages", "data", $f, string(string(l.name.name), ".txt"))
      Base.depwarn("Use of Languages as types is deprecated. Use instances.", Symbol(T))
      return fetch_word_list(filename)
    end

    $(Symbol(f))(l::T) where T <: Language = $(Symbol(f))(T)
  end
end
