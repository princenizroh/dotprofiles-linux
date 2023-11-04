-- Vim autocmd untuk menangani highlighting pada berkas Zsh
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "zsh", "fish" }, -- Menambahkan "fish" untuk mendeteksi berkas dengan ekstensi ".fish"
  callback = function()
    -- Biarkan treesitter menggunakan highlight Bash untuk berkas Zsh atau Fish
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { ".config/lvim/config.lua" },
  command = "PackerCompile",
})
