return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				explorer = {
					win = {
						list = {
							keys = {
								["x"] = "explorer_move",
							},
						},
					},
				},
			},
		},
	},
}
