Languages.jl
============
[![Build Status](https://travis-ci.org/JuliaText/Languages.jl.svg)](https://travis-ci.org/JuliaText/Languages.jl)
[![Languages](http://pkg.julialang.org/badges/Languages_0.5.svg)](http://pkg.julialang.org/?pkg=Languages)
[![Languages](http://pkg.julialang.org/badges/Languages_0.6.svg)](http://pkg.julialang.org/?pkg=Languages)


## Introduction

Languages.jl is a Julia package for working with human languages. It provides:

* Lists of words from each language for basic categories:
	* Articles
		* Indefinite Articles
		* Definite Articles
	* Prepositions
	* Pronouns
	* Stopwords

	These methods are supported only for English and German currently.

	This package also detects the script and language for written text in a wide variety of languages.  

## Usage

	using Languages

	articles(Languages.English())
	stopwords(Languages.English())

All word lists are returned as vectors of UTF-8 strings.

## Script detection

Script detection model works by checking the unicode character ranges present within
the input text

  Languages.detect_script("To be or not to be") # => Languages.LatinScript()

## Language Detection

A trigram based model is used to detect the language for the text. The model is
filtered based on the detected script.

We detect 84 of the most common languages spoken around the world. This usually
covers most languages with more than 10 million native speakers.

  detector = LanguageDetector()
	detector("To be or not to be")
  # (Languages.English(), Languages.LatinScript(), 1.0)

The `LanguageDetector` model returns the language, the script, and the confidence when applied to a string.

The language and script detection code in this package is heavily inspired from  the rust package [whatlang-rs](https://github.com/greyblake/whatlang-rs). That package is in turn derived from [franc](https://github.com/wooorm/franc). See `LICENSE.whatlang-rs` for details.

## Deprecations

The API of this package has been refurbished recently. If you have used this package earlier,
please be aware of these changes.

  * The language names have been shortened. So `English` instead of `EnglishLanguage`. However, the language names are no longer exported. So they should be referred to with the package name: `Languages.English`
	* Every language is a type. However all functions now accept and return instances of these types, rather than the types themselves.
