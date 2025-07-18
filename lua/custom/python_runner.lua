local FTerm = require("FTerm")

local function close_terminal()
	if not FTerm.get_job_id() then
		require("noice").notify("Floating terminal is not present", vim.log.levels.ERROR)
		return
	end

	FTerm.close()
end

local function run_current_python_script()
	local file_path = vim.api.nvim_buf_get_name(0)
	local file_name = vim.fn.fnamemodify(file_path, ":t")
	local file_extension = vim.fn.fnamemodify(file_name, ":e")

	if file_extension ~= "py" then
		require("noice").notify("Incorrect file extension", vim.log.levels.ERROR, {})
		return
	end

	FTerm.run({ "py", vim.api.nvim_buf_get_name(0) })
end

vim.keymap.set("n", "<leader>r", run_current_python_script, { desc = "Run current python script in floating terminal" })
vim.keymap.set("t", "<leader>q", close_terminal, { desc = "Close terminal" })
