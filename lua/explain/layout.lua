local Layout = require("nui.layout")
local Popup = require("nui.popup")
local notify = require("noice")

local layout = nil

local function mount_explain_layout()
	local top_popup = Popup({ border = "double" })
	local bottom_left_popup = Popup({ border = "single" })
	local bottom_right_popup = Popup({ border = "single" })

	layout = Layout(
		{
			position = "50%",
			size = {
				width = 80,
				height = 40,
			},
		},
		Layout.Box({
			Layout.Box(top_popup, { size = "40%" }),
			Layout.Box({
				Layout.Box(bottom_left_popup, { size = "50%" }),
				Layout.Box(bottom_right_popup, { size = "50%" }),
			}, { dir = "row", size = "60%" }),
		}, { dir = "col" })
	)

	layout:mount()
end

local function unmount_layout()
	if layout then
		layout:unmount()
		layout = nil
	else
		require("noice").notify("No layout is mounted!", "error")
	end
end

vim.keymap.set("n", "<leader>xp", mount_explain_layout, { desc = "Mount explain layout" })
vim.keymap.set("n", "<leader>xc", unmount_layout, { desc = "Unmount explain layout" })
