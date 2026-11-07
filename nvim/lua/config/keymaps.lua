-- lua/config/keymaps.lua

local map = vim.keymap.set

-- Reload config
map("n", "<leader>r", "<cmd>source $MYVIMRC<CR>", { desc = "Reload Neovim config", })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
-- map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Clear search highlighting
-- map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Save
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer", })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer",})

-- Quit
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

-- Move selected lines
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- # Plugins
-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
callback = function(args)
		local opts = { buffer = args.buf, silent = true }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			buffer = args.buf,
			desc = "Go to definition",
		})

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
			buffer = args.buf,
			desc = "Go to declaration",
		})

		vim.keymap.set("n", "]g", vim.diagnostic.goto_next)

		vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

		vim.keymap.set("n", "gr", vim.lsp.buf.references, {
			buffer = args.buf,
			desc = "Find references",
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {
			buffer = args.buf,
			desc = "Hover documentation",
		})

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
			buffer = args.buf,
			desc = "Rename symbol",
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
			buffer = args.buf,
			desc = "Code action",
		})
	end,
})
