for f in (:articles, :indefinite_articles, :definite_articles,
          :prepositions, :pronouns, :stopwords)
  @eval begin
    function ($f){T <: Language}(l::Type{T})
      basedir = Pkg.package_directory("Languages")
      filename = file_path(basedir, "data", string($(f)), strcat(string(l), ".txt"))
      return fetch_word_list(filename)
    end
  end
end
