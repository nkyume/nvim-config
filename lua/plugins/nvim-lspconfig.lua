local configus = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	lspconfig.clangd.setup({
		capabilities = capabilities,
	})
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
	})
	lspconfig.jedi_language_server.setup({
		capabilities = capabilities,
	})
	lspconfig.biome.setup({
		capabilities = capabilities,
	})
	--	lspconfig.sqlls.setup({
	--		capabilities = capabilities,
	--	})

	-- Lua
	local stylua = require("efmls-configs.formatters.stylua")
	local luacheck = require("efmls-configs.linters.luacheck")

	-- Python
	local flake8 = require("efmls-configs.linters.flake8")
	local yapf = require("efmls-configs.formatters.yapf")
	local isort = require("efmls-configs.formatters.isort")

	-- SQL
	local sql_formatter = require("efmls-configs.formatters.sql-formatter")

	-- java_script
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier = require("efmls-configs.formatters.prettier")

	local languages = {
		lua = { stylua, luacheck },
		python = { flake8, yapf, isort },
		sql = { sql_formatter },
		java_script = { prettier, eslint_d },
	}

	local efmls_config = {
		filetypes = vim.tbl_keys(languages),
		settings = {
			rootMarkers = { ".git/" },
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	}

	lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {}))

	-- Keybinds
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			local opts = { buffer = ev.buff }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)

			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = configus,
}
