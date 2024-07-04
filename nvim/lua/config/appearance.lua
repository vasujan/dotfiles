
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Transparent background
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"

-- Transparent rule line
--vim.cmd "hi statusline guibg=NONE ctermbg=NONE"
--vim.cmd "hi StatusLine ctermbg=0 cterm=NONE"
-- vim.cmd "hi StatusLine guifg=NvimLightGrey3 guibg=NONE"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Keep signcolumn on by default (gutter)
vim.opt.signcolumn = 'yes'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
