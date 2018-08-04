for f in ("articles", "indefinite_articles", "definite_articles", "prepositions", "pronouns", "stopwords")
  @eval begin
    function $(Symbol(f)){T <: Language}(l::T)
      filename = Pkg.dir("Languages", "data", $f, Languages.english_name(l)*".txt")
      return fetch_word_list(filename)
    end
  end

  # Deprecations
  @eval begin
    function $(Symbol(f)){T <: Language}(l::Type{T})
      Base.depwarn("Use of Languages as types is deprecated. Use instances.", Symbol(T))
      $(Symbol(f))(l())
    end
  end
end
