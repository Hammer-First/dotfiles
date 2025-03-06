return {
    {
        "rhysd/committia.vim",
        config = function()
            vim.cmd([[
                let g:committia_hooks = {}
                let g:committia_edit_window_width = 60
                let g:committia_min_window_width = 100
                function! g:committia_hooks.edit_open(info)
                    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
                    nmap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
                    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
                    nmap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
                endfunction
            ]])
        end,
    },
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("n", "<leader>hp", gitsigns.preview_hunk)
		end,
	},
}
