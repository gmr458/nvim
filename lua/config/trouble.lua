local trouble_loaded, trouble = pcall(require, "trouble")

if not trouble_loaded then
    return
end

trouble.setup()
