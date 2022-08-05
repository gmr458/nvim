local impatient_loaded, impatient = pcall(require, "impatient")

if not impatient_loaded then
    print("impatient not loaded")
    return
end

impatient.enable_profile()
