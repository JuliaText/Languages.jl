using Documenter
using Languages

makedocs(
    sitename = "Languages",
    format = Documenter.HTML(),
    modules = [Languages],
    pages = [
        "Home" => "index.md",
        "API" => "api.md"
    ]
)