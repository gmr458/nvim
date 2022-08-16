local template_string_loaded, template_string = pcall(require, "template-string")

if not template_string_loaded then
    print("template-string not loaded")
    return
end

template_string.setup()
