return {
	{
		-- オートペア用のプラグイン
		"hrsh7th/nvim-insx",
		config = function()
			require("insx.preset.standard").setup()
		end,
	},
	{
		-- チャンク/ブロックの範囲を示すプラグイン
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
				},
			})
		end,
	},
	{
		-- 括弧などで文字列を囲むプラグイン
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		-- カーソル移動用のプラグイン
		"hadronized/hop.nvim",
		branch = "v2",
		opts = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			vim.keymap.set("n", "s", ":HopWord<CR>")
			vim.keymap.set("n", "<Leader>s", ":HopLineStart<CR>")
		end,
	},
}
