local config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"jedi_language_server",
		},
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	config = config,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
