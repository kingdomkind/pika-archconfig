--> Enable system clipboard support
vim.opt.clipboard:append("unnamedplus")

--> Disable background colour (so can see transparency)
vim.api.nvim_command('autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE')

--> Enable relative line numbers
vim.wo.relativenumber = true

--> Enable absolute line number for the current line
vim.wo.number = true

