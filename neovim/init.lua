--> Enable system clipboard support
vim.opt.clipboard:append("unnamedplus")

--> Disable background colour (so can see transparency)
vim.api.nvim_command('autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE')

--> Enable relative line numbers
vim.wo.relativenumber = true

--> Enable absolute line number for the current line
vim.wo.number = true

--> Hide sign column
vim.wo.signcolumn = "no"

--> Setup plugins
require("lazy").setup(
{
	"williamboman/mason.nvim", -- Base LSP & Language Server Installer
	"williamboman/mason-lspconfig.nvim", -- BRridges mason and lspconfig to allow them to be used together
	"neovim/nvim-lspconfig", -- Allows you to configure LSPs & Language Servers
})

--> Setup plugin installers
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "rust_analyzer"}, -- Language Servers to be installed
}

--> Setup language Servers
require("lspconfig").lua_ls.setup({})
require("lspconfig").rust_analyzer.setup({})
