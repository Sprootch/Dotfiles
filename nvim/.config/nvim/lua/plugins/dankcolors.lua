return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#191114',
				base01 = '#191114',
				base02 = '#a5989e',
				base03 = '#a5989e',
				base04 = '#ffeff6',
				base05 = '#fff8fb',
				base06 = '#fff8fb',
				base07 = '#fff8fb',
				base08 = '#ff9fa4',
				base09 = '#ff9fa4',
				base0A = '#ffbcda',
				base0B = '#bdffa5',
				base0C = '#ffdbeb',
				base0D = '#ffbcda',
				base0E = '#ffc8e0',
				base0F = '#ffc8e0',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a5989e',
				fg = '#fff8fb',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ffbcda',
				fg = '#191114',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a5989e' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffdbeb', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffc8e0',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ffbcda',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ffbcda',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffdbeb',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#bdffa5',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ffeff6' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ffeff6' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a5989e',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
