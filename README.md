Languages.jl
============
[![Build Status](https://travis-ci.org/JuliaText/Languages.jl.svg)](https://travis-ci.org/JuliaText/Languages.jl)
[![Languages](http://pkg.julialang.org/badges/Languages_0.5.svg)](http://pkg.julialang.org/?pkg=Languages)
[![Languages](http://pkg.julialang.org/badges/Languages_0.6.svg)](http://pkg.julialang.org/?pkg=Languages)


# Introduction

Languages.jl is a Julia package for working with human languages. It provides:

* Lists of words from each language for basic categories:
	* Articles
		* Indefinite Articles
		* Definite Articles
	* Prepositions
	* Pronouns
	* Stopwords

# Usage

	using Languages

	articles(EnglishLanguage)
	stopwords(EnglishLanguage)

All word lists are returned as vectors of UTF-8 strings.
