return {
    filetypes = {
        -- "css",
        "django-html",
        "ejs",
        "handlebars",
        "hbs",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "typescriptreact",
    },
    init_options = {
        html = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            options = {
                ["output.selfClosingStyle"] = "xhtml", -- Style of self-closing tags: html (`<br>`), xml (`<br/>`) or xhtml (`<br />`)
                ["jsx.enabled"] = true, -- Enable/disable JSX addon
            },
        },
    },
}
