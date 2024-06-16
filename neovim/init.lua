vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_command('autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE')


-- Enable relative line numbers
vim.wo.relativenumber = true

-- Enable absolute line number for the current line
vim.wo.number = true

