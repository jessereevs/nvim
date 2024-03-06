--[[
return {
    'williamboman/mason.nvim',
    dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { 'lua_ls', 'clangd', 'tsserver', 'tailwindcss' }
        })

        local on_attach = function()
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end

        require("lspconfig").lua_ls.setup {
            on_attach = on_attach
        }
        require('lspconfig').clangd.setup {
            on_attach = on_attach
        }
        require('lspconfig').tsserver.setup {
            on_attach = on_attach
        }
        require('lspconfig').tailwindcss.setup {
            on_attach = on_attach
        }

    end
}
]]--

return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset('recommended')
        lsp.nvim_workspace()
        lsp.setup()
    end
}
































