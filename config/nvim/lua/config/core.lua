vim.opt.number = true
vim.opt.relativenumber = true
vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block'
vim.o.tabstop = 4  -- Insert 4 spaces for a tab
vim.o.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.o.expandtab = true -- Converts tabs to spaces

vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>n', '<cmd>bnext<cr>')
vim.keymap.set('n', '<Leader>p', '<cmd>bprev<cr>')
vim.keymap.set('n', '<Leader>d', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<Leader>e', '<cmd>Oil<cr>')

--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')


if vim.uv.os_uname().sysname ~= 'Windows_NT' then
    vim.keymap.set('n', '<Leader>br', '<cmd>!./run.sh<cr>')
    vim.keymap.set('n', '<Leader>bb', '<cmd>!./build.sh<cr>')
else
    vim.keymap.set('n', '<Leader>br', '<cmd>!.\\run.bat<cr>')
    vim.keymap.set('n', '<Leader>bb', '<cmd>!.\\build.bat<cr>')
end

