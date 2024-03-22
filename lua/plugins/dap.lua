local config = function()
	local dap, dapui = require("dap"), require("dapui")

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
	require("dapui").setup()
	require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

	vim.keymap.set("n", "<F5>", function()
		require("dap").continue()
	end)
	vim.keymap.set("n", "<Leader>b", function()
		require("dap").toggle_breakpoint()
	end)
end

return {
	"mfussenegger/nvim-dap",
	config = config,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
}
