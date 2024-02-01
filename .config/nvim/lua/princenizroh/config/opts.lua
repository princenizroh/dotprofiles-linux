local options = {
  autoindent = true,
  smartindent = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  showtabline = 0,
  showmatch = true,

  number = true,
  relativenumber = true,
  numberwidth = 4,
  incsearch = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  termguicolors = true,
  hidden = true,
  signcolumn = "yes",
  showmode = false,
  errorbells = false,
  wrap = false,
  cursorline = true,
  encoding = "utf-8",
  fileencoding = "utf-8",
  completeopt = "menuone,noinsert,noselect",
  writebackup = false,
  backup = false,
  modifiable = true,

  undofile = true,
  swapfile = true,
  directory = os.getenv("HOME") .. "/.vim/swp",
  undodir = os.getenv("HOME") .. "/.vim/undodir",

  updatetime = 20,
  scrolloff = 15,

  title = true,
  titlestring = "Neovim - %t",
  guifont = "MesloLGS NF:h18",
  clipboard = "unnamedplus",
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

if vim.g.neovide then
  vim.g.neovide_transparency = 1
  vim.g.transparency = 0.8
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_input_macos_alt_is_meta = false
end
