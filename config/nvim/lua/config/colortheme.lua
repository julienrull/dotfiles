---- Default options:
--require("gruvbox").setup({
--  terminal_colors = true, -- add neovim terminal colors
--  undercurl = true,
--  underline = true,
--  bold = true,
--  italic = {
--    strings = true,
--    emphasis = true,
--    comments = true,
--    operators = false,
--    folds = true,
--  },
--  strikethrough = true,
--  invert_selection = false,
--  invert_signs = false,
--  invert_tabline = false,
--  invert_intend_guides = false,
--  inverse = true, -- invert background for search, diffs, statuslines and errors
--  contrast = "", -- can be "hard", "soft" or empty string
--  palette_overrides = {},
--  overrides = {},
--  dim_inactive = false,
--  transparent_mode = false,
--})
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

vim.cmd.colorscheme("gruber-darker")
vim.cmd("hi Normal guibg=none ctermbg=none")
vim.cmd("hi NormalNC guibg=none ctermbg=none")
vim.cmd("hi SignColumn guibg=none")
vim.cmd("hi EndOfBuffer guibg=none")
