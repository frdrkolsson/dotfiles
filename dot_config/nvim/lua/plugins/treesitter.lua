return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"ruby",
			"javascript",
			"typescript",
			"html",
			"css",
			"scss",
			"markdown",
			"markdown_inline",
      "embedded_template",
      "tsx",
      "json",
      "jsonc",
      "yaml",
		},
		highlight = { enable = true },
	},
  config = function (_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end
}
