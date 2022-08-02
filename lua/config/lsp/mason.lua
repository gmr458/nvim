local mason_loaded, mason = pcall(require, "mason")

if mason_loaded == false then
    print("mason not loaded")
    return
end

mason.setup()
