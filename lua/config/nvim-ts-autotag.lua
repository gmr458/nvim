local autotag_loaded, autotag = pcall(require, "nvim-ts-autotag")

if not autotag_loaded then
    print("nvim-ts-autotag not loaded")
    return
end

autotag.setup()
