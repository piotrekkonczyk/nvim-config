return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			transparent = true,
			styles = {
				comments = { italic = false }, -- Disable italics in comments
			},
		})

		-- Set the colorscheme
		vim.cmd.colorscheme("tokyonight-night")

		-- Hide tildes (~) at the end of buffer
		vim.opt.fillchars:append({ eob = " " })

		-- Optional: make background transparent even if theme resets it
		vim.cmd([[
      hi Normal guibg=NONE
      hi NormalNC guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]])
	end,
}
