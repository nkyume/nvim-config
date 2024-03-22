local config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"efm",
			-- Lua
			"lua_ls",

			-- Python
			"jedi_language_server",

			-- JS
			"biome",
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
