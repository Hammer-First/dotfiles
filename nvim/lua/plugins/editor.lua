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
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {},
    },
}
