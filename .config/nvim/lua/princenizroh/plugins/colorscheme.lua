return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 999,
  config = function()
    vim.cmd("colorscheme tokyonight-moon")
    --   vim.cmd("hi Normal guibg=none ctermbg=none")
    -- vim.cmd("hi CursorLine guibg=none ctermbg=none")
    --   vim.cmd("hi SignColumn guibg=none ctermbg=none")
    --   vim.cmd("hi StatusLine guibg=none ctermbg=none")
  end,
}
