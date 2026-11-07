-- lua/config/options.lua

local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = true
opt.statuscolumn = "%{printf('%4d', v:lnum)} │ %=%{printf('%3d', v:relnum)} │"
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.list = true
opt.listchars = {
	tab = "→ ",
	space = "·",
	trail = "·",
	nbsp = "␣",
}

-- Editing
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.textwidth = 0

-- Wrapping
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Files
opt.undofile = true
opt.swapfile = true
opt.backup = false

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- UI
opt.showmode = false
opt.laststatus = 3

-- Misc
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 500
