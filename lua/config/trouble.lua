local trouble_loaded, trouble = pcall(require, "trouble")

if trouble_loaded == false then
    return
end

trouble.setup()
