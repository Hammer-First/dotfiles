return {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {},
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.markdownlint,
					null_ls.builtins.diagnostics.markdownlint.with({
						extra_args = { "--config", "~/dotfiles/nvim/config/markdownlint.json" },
					}),
				},
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										-- only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			}
		end,
	},
}
