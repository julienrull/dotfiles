require("nvim-treesitter.configs").setup {
          ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "javascript", "typescript", "html", "css", "odin", "python", "rust", "php", "bash", "go"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
}
