abstract Language

# Languages currently supported by Snowball
abstract DanishLanguage     <: Language
abstract DutchLanguage      <: Language
abstract EnglishLanguage    <: Language
abstract FinnishLanguage    <: Language
abstract FrenchLanguage     <: Language
abstract GermanLanguage     <: Language
abstract HungarianLanguage  <: Language
abstract ItalianLanguage    <: Language
abstract NorwegianLanguage  <: Language
abstract PortugueseLanguage <: Language
abstract RomanianLanguage   <: Language
abstract RussianLanguage    <: Language
abstract SpanishLanguage    <: Language
abstract SwedishLanguage    <: Language
abstract TurkishLanguage    <: Language

# These are ISO 639-2T alpha-3 and ISO 639-3 codes
isocode(lang::Type{DanishLanguage})     = "dan"
isocode(lang::Type{DutchLanguage})      = "nld"
isocode(lang::Type{EnglishLanguage})    = "eng"
isocode(lang::Type{FinnishLanguage})    = "fin"
isocode(lang::Type{FrenchLanguage})     = "fra"
isocode(lang::Type{GermanLanguage})     = "deu"
isocode(lang::Type{HungarianLanguage})  = "hun"
isocode(lang::Type{ItalianLanguage})    = "ita"
isocode(lang::Type{NorwegianLanguage})  = "nor"
isocode(lang::Type{PortugueseLanguage}) = "por"
isocode(lang::Type{RomanianLanguage})   = "ron"
isocode(lang::Type{RussianLanguage})    = "rus"
isocode(lang::Type{SpanishLanguage})    = "spa"
isocode(lang::Type{SwedishLanguage})    = "swe"
isocode(lang::Type{TurkishLanguage})    = "tur"

name(lang::Type{DanishLanguage})     = "danish"
name(lang::Type{DutchLanguage})      = "dutch"
name(lang::Type{EnglishLanguage})    = "english"
name(lang::Type{FinnishLanguage})    = "finnish"
name(lang::Type{FrenchLanguage})     = "french"
name(lang::Type{GermanLanguage})     = "german"
name(lang::Type{HungarianLanguage})  = "hungarian"
name(lang::Type{ItalianLanguage})    = "italian"
name(lang::Type{NorwegianLanguage})  = "norwegian"
name(lang::Type{PortugueseLanguage}) = "portuguese"
name(lang::Type{RomanianLanguage})   = "romanian"
name(lang::Type{RussianLanguage})    = "russian"
name(lang::Type{SpanishLanguage})    = "spanish"
name(lang::Type{SwedishLanguage})    = "swedish"
name(lang::Type{TurkishLanguage})    = "turkish"
