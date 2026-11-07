-- lua/config/autocmds.lua

local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Don't automatically insert comments on new lines
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Autosave on focus lost or buffer leave
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
    callback = function(args)
        if vim.bo[args.buf].modified
            and vim.bo[args.buf].buftype == ""
            and vim.bo[args.buf].modifiable
        then
            vim.cmd("silent update")
        end
    end,
})
