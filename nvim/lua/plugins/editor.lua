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
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},
}
