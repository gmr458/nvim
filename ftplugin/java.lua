local ok, jdtls = pcall(require, "jdtls")
if not ok then
    vim.notify("jdtls could not be loaded")
    return
end

local ok_mason, mason_registry = pcall(require, "mason-registry")
if not ok_mason then
    vim.notify("mason-registry could not be loaded")
    return
end

local jdtls_install_location = mason_registry.get_package("jdtls"):get_install_path()

local operative_system
if vim.fn.has("linux") then
    operative_system = "linux"
elseif vim.fn.has("win32") then
    operative_system = "win"
elseif vim.fn.has("macunix") then
    operative_system = "mac"
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.loop.os_homedir() .. "/.cache/jdtls/workspace/" .. project_name

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        -- 💀
        "java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- 💀
        "-jar",
        vim.fn.glob(jdtls_install_location .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                           ^^^^^^^^^^^^^^
        -- Must point to the                                                         Change this to
        -- eclipse.jdt.ls installation                                               the actual version, with vim.fn.glob() is not necessary

        -- 💀
        "-configuration",
        jdtls_install_location .. "/config_" .. operative_system,
        -- ^^^^^^^^^^^^^^^^^^^                  ^^^^^^
        -- Must point to the                    Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation          Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
    },

    on_attach = require("config.lsp").on_attach,

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {},
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        -- workspace = workspace_dir,
        bundles = {},
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)