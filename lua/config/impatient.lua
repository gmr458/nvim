local impatient_loaded, impatient = pcall(require, "impatient")

if impatient_loaded == false then
    print("impatient not loaded")
    return
end

impatient.enable_profile()
