local HOME = os.getenv("HOME")

return {
    cmd = { "dotnet", HOME .. "/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
}
