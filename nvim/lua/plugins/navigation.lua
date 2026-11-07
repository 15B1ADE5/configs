return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			window = {
				position = "left",
				width = 35,
			};
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			-- Open Neo-tree when Neovim starts.
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					vim.cmd("Neotree show left")
				end,
			})
			-- Disable line numbers in Neo-tree.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "neo-tree",
				callback = function()
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
					vim.opt_local.statuscolumn = ""
				end,
			})
			vim.api.nvim_create_autocmd("WinEnter", {
				callback = function()
					if vim.bo.filetype == "neo-tree" then
						vim.opt_local.number = false
						vim.opt_local.relativenumber = false
						vim.opt_local.statuscolumn = ""
					end
				end,
			})
		end,
	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
}
