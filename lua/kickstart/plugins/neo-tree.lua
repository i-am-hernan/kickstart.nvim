return {
	'nvim-neo-tree/neo-tree.nvim',
	version = '*',
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	keys = {
		{ '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- show hidden files
			},
			window = {
				mappings = {
					['\\'] = 'close_window',
				},
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = "", -- nf-oct-file_directory
				folder_open   = "", -- you can change this to another if you want different
				folder_empty  = "",
			},
			git_status = {
				symbols = {
					added     = "+", -- or "✚"
					modified  = "~", -- or ""
					deleted   = "×", -- or "✘"
					renamed   = "»",
					untracked = "*", -- <-- the one causing squares; make it safe
					ignored   = "◌",
					unstaged  = "",
					staged    = "",
					conflict  = "!",
				},
				-- optional: rely on your file colors only, not git-status colors
				-- use_git_status_colors = false,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		-- disable italics for git status symbols
		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { italic = false })
		vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { italic = false })
		vim.api.nvim_set_hl(0, "NeoTreeGitStaged", { italic = false })
		vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { italic = false })
		-- make sure truecolor is on
		vim.opt.termguicolors = true

		-- icons: teal
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#00bfa5" })
		vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { underline = true, sp = "#00bfa5" })

		-- names: gold (nice contrast with teal)
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#ffffff" })

		-- root name: teal + bold
		vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#008080" })

		-- hide the cursor only inside Neo-tree buffers
		-- define a fully transparent cursor highlight (once, globally)
		vim.api.nvim_set_hl(0, "NoCursor", { blend = 100 })
	end
}
