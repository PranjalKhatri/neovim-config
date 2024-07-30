return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd", "--fallback-style=webkit" },
				init_options = {
					clangdFileStatus = true,
					usePlaceholders = true,
					completeUnimported = true,
					semanticHighlighting = true,
				},
				settings = {
					compilerPath = "D:/winlibs/mingw64/bin/g++.exe",
					ccls = {
						includePath = {
							"D:/winlibs/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/13.2.0/include",
							"D:/winlibs/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/13.2.0/../../../../include",
							"D:/winlibs/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/13.2.0/include-fixed",
							"D:/winlibs/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/13.2.0/../../../../x86_64-w64-mingw32/include",
						},
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
