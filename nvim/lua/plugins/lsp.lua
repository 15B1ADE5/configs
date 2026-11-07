return {
    {
        "neovim/nvim-lspconfig",
        ft = { "c", "cpp" },
        config = function()
            vim.lsp.enable("clangd")
        end,
    },
}
