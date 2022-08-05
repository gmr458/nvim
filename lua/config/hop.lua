local hop_loaded, hop = pcall(require, "hop")

if not hop_loaded then
    print("hop not loaded")
    return
end

hop.setup()
