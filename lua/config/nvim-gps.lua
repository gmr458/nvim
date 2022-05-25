local status_ok, nvim_gps = pcall(require, "nvim-gps")

if not status_ok then
    return
end

nvim_gps.setup({
    disable_icons = false,
    icons = {
        ["class-name"] = "Class: ",
        ["function-name"] = "Function: ",
        ["method-name"] = "Method: ",
        ["container-name"] = "Container: ",
        ["tag-name"] = "Tag: ",
    },
    languages = {
        ["json"] = {
            icons = {
                ["array-name"] = "Array: ",
                ["object-name"] = "Object: ",
                ["null-name"] = "Null: ",
                ["boolean-name"] = "Boolean: ",
                ["number-name"] = "Number: ",
                ["string-name"] = "String: ",
            },
        },
        ["latex"] = {
            icons = {
                ["title-name"] = "Title: ",
                ["label-name"] = "Label: ",
            },
        },
        ["lua"] = {
            icons = {
                ["container-name"] = "Table: ",
            },
        },
        ["norg"] = {
            icons = {
                ["title-name"] = "Title: ",
            },
        },
        ["scss"] = {
            icons = {
                ["scss-name"] = "",
                ["scss-mixin-name"] = "@mixin: ",
                ["scss-include-name"] = "@include: ",
                ["scss-keyframes-name"] = "@keyframes: ",
            },
        },
        ["toml"] = {
            icons = {
                ["table-name"] = "Table: ",
                ["array-name"] = "Array: ",
                ["boolean-name"] = "Boolean: ",
                ["date-name"] = "Date: ",
                ["date-time-name"] = "DateTime: ",
                ["float-name"] = "Float: ",
                ["inline-table-name"] = "InlineTable: ",
                ["integer-name"] = "Integer: ",
                ["string-name"] = "String: ",
                ["time-name"] = "Time: ",
            },
        },
        ["tsx"] = {
            icons = {
                ["hook-name"] = "Hook: ",
            },
        },
        ["verilog"] = {
            icons = {
                ["module-name"] = "Module: ",
            },
        },
        ["yaml"] = {
            icons = {
                ["mapping-name"] = "Mapping ",
                ["sequence-name"] = "Sequence: ",
                ["null-name"] = "Null: ",
                ["boolean-name"] = "Boolean: ",
                ["integer-name"] = "Integer: ",
                ["float-name"] = "Float: ",
                ["string-name"] = "String: ",
            },
        },
        ["yang"] = {
            icons = {
                ["module-name"] = "Module: ",
                ["augment-path"] = "Augment: ",
                ["container-name"] = "Container: ",
                ["grouping-name"] = "Grouping: ",
                ["typedef-name"] = "Typedef: ",
                ["identity-name"] = "Identity: ",
                ["list-name"] = "List: ",
                ["leaf-list-name"] = "LeafList: ",
                ["leaf-name"] = "Leaf: ",
                ["action-name"] = "Action: ",
            },
        },
    },
    separator = " ❯ ",
})
