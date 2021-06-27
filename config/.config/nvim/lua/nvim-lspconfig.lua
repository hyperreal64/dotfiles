-- Bash LSP
require'lspconfig'.bashls.setup{}

-- Docker LSP
require'lspconfig'.dockerls.setup{}

-- JSON LSP
require'lspconfig'.jsonls.setup{}

-- Python LSP (Pyright)
require'lspconfig'.pyright.setup{
    cmd = { "/home/jas/.nix-profile/bin/pyright-langserver" }
}

-- Rnix LSP
require'lspconfig'.rnix.setup{
  cmd = { "/home/jas/.nix-profile/bin/rnix-lsp" }
}

-- YAML LSP
require'lspconfig'.yamlls.setup{}

-- Sumneko Lua LSP
local sumneko_root_path = "/home/jas/.local/share/sumneko/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
