Languages.jl
============
[![Build Status](https://travis-ci.org/johnmyleswhite/Languages.jl.svg)](https://travis-ci.org/johnmyleswhite/Languages.jl)
[![Languages](http://pkg.julialang.org/badges/Languages_0.3.svg)](http://pkg.julialang.org/?pkg=Languages)
[![Languages](http://pkg.julialang.org/badges/Languages_0.4.svg)](http://pkg.julialang.org/?pkg=Languages)
[![Languages](http://pkg.julialang.org/badges/Languages_0.5.svg)](http://pkg.julialang.org/?pkg=Languages)



# NOTICE

**This package is unmaintained. Its reliability is not guaranteed.**

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
