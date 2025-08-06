return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			float = { transparent = true, solid = false },
			transparent_background = true,
			flavour = "macchiato",
			integrations = {
				notify = true,
			},
		})
	end,
}
