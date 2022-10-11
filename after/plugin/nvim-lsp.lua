
require("nvim-lsp-installer").setup()

local servers = { 'pyright', 'clangd', 'sumneka_lua', 'gopls', 'omnisharp' }

require("lspconfig").clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'c', 'cpp', 'cc' }
}
require("lspconfig").gopls.setup{}
require("lspconfig").omnisharp.setup{}
require("lspconfig").pyright.setup{}
