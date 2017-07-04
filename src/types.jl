@compat abstract type Language; end

# Languages currently supported by Snowball
@compat abstract type DanishLanguage     <: Language; end
@compat abstract type DutchLanguage      <: Language; end
@compat abstract type EnglishLanguage    <: Language; end
@compat abstract type FinnishLanguage    <: Language; end
@compat abstract type FrenchLanguage     <: Language; end
@compat abstract type GermanLanguage     <: Language; end
@compat abstract type HungarianLanguage  <: Language; end
@compat abstract type ItalianLanguage    <: Language; end
@compat abstract type NorwegianLanguage  <: Language; end
@compat abstract type PortugueseLanguage <: Language; end
@compat abstract type RomanianLanguage   <: Language; end
@compat abstract type RussianLanguage    <: Language; end
@compat abstract type SpanishLanguage    <: Language; end
@compat abstract type SwedishLanguage    <: Language; end
@compat abstract type TurkishLanguage    <: Language; end

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
