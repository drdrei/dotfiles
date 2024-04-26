return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = { "TSUpdateSync" },
	opts = {
		sync_install = false,
		auto_install = true,
		ignore_install = { "" },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"javascript",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"prisma",
			"tsx",
			"tsx",
			"typescript",
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local added = {}
		opts.ensure_installed = vim.tbl_filter(function(lang)
			if added[lang] then
				return false
			end
			added[lang] = true
			return true
		end, opts.ensure_installed)

		require("nvim-treesitter.configs").setup(opts)
	end,
}
