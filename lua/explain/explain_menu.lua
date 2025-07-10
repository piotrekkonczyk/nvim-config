local Menu = require("nui.menu")

local popup_options = {
	size = { height = 20, width = 40 },
	border = {
		style = "rounded",
		text = {
			top = "[Choose Item]",
			top_align = "center",
		},
	},
	win_options = {
		winhighlight = "Normal:Normal",
	},
	position = {
		row = 10,
		col = 70,
	},
}

local menu = nil

local function mount_explain_menu()
	menu = Menu(popup_options, {
		lines = {
			Menu.separator("Group One"),
			Menu.item("Ask AI"),
			Menu.separator("Group Two"),
			Menu.item("Generate docstring"),
			Menu.item("Refactor code"),
			Menu.separator("Group Three"),
			Menu.item("Summarize file"),
			Menu.item("Tests with pytest"),
		},
		max_width = 50,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("CLOSED")
		end,
		on_submit = function(item)
			print("SUBMITTED", vim.inspect(item))
			print(item.text)

			-- TODO: create handler for item.text as the `explain` command e.g ask, refactor etc.
		end,
	})
	menu:mount()
end

local function unmount_menu()
	if menu then
		menu:unmount()
		menu = nil
	else
		require("noice").notify("No menu is mounted!", "error")
	end
end

vim.keymap.set("n", "<leader>xp", mount_explain_menu, { desc = "Mount explain menu" })
vim.keymap.set("n", "<leader>xc", unmount_menu, { desc = "Unmount explain menu" })
