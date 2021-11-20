require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    ignore_install = {
        "beancount",
        "bibtex",
        "clojure",
        "cmake",
        "comment",
        "commonlisp",
        "css",
        "cuda",
        "dart",
        "devicetree",
        "dot",
        "elixir",
        "elm",
        "erlang",
        "fennel",
        "fish",
        "fortran",
        "gdscript",
        "glimmer",
        "glsl",
        "godot",
        "haskell",
        "hcl",
        "heex",
        "html",
        "julia",
        "kotlin",
        "latex",
        "ledger",
        "nix",
        "ocaml",
        "ocaml_interface",
        "pioasm",
        "ql",
        "query",
        "r",
        "rst",
        "ruby",
        "scala",
        "scss",
        "sparql",
        "supercollider",
        "surface",
        "swift",
        "teal",
        "tlaplus",
        "turtle",
        "verilog",
        "yang",
        "zig",
    },
    highlight = { enable = true },
})
