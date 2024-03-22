local config = function()
	vim.cmd.colorscheme("catppuccin-mocha")
end

return {
	"catppuccin/nvim",
	config = config,
	name = "catppuccin",
	priority = 1000,
}
