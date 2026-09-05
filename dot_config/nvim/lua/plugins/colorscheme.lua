return {

	{ "catppuccin/nvim" },

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-nvim",
		},
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			flavour = "mocha", -- Sets the flavor to Mocha
			transparent_background = false, -- Keep false to preserve the deep space/armor background look
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope = true,
				},
			},
		},
	},
}
