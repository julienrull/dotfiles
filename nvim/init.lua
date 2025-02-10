require("config.lazy")
require("config.core")
require("config.autoclose")
require("config.oil")
require("config.transparent")
require("config.lualine")
require("config.treesitter")
require("config.cmp")
require("config.mason")

vim.opt.shell = 'pwsh.exe -nologo'
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
