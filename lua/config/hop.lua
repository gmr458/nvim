local hop_loaded, hop = pcall(require, "hop")

if hop_loaded == false then
    print("hop not loaded")
    return
end

hop.setup()
