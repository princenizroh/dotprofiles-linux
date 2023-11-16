-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Function to create File external
reload("user.highligts")
reload("user.maps")
reload("user.base")
reload("user.options")
reload("user.filetype")
reload("user.kind")
reload("user.keymaps")
reload("user.banners")
reload("user.statusline")
reload("user.plugins")
reload("plugin.presence")
reload("plugin.lsp")
reload("plugin.autocmd")
reload("plugin.colorscheme")
reload("plugin.omnisharp")
reload("plugin.neosolarized")
reload("plugin.copilot")
reload("plugin.null-ls")
vim.g.shell = '/usr/bin/fish'

-- ale plugins
vim.g.ale_linters = {
  cs = { 'OmniSharp', 'mcs', 'mcsc' }
}
vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_style_warning = '·'
vim.g.ale_fixers = {
  'OmniSharp'
}
vim.g.ale_cs_mcsc_assemblies = {
  vim.fn.expand('/home/prince/Unity/Hub/Editor/2023.1.3f1/Editor/Data/Managed/UnityEngine.dll'),
  vim.fn.expand('/home/prince/Unity/Hub/Editor/2023.1.15f1/Editor/Data/Managed/UnityEngine.dll')
}
vim.g.ale_set_balloons = 1

local function set_lightline_ale_indicators()
  vim.cmd [[
    let g:ale_statusline_format = {
      \ 'warnings': '%{["g:lightline#ale#indicator_warnings"]}',
      \ 'errors': '%{["g:lightline#ale#indicator_errors"]}',
      \ 'ok': '%{["g:lightline#ale#indicator_ok"]}',
      \ 'infos': '%{["g:lightline#ale#indicator_infos"]}',
      \ 'checking': '%{["g:lightline#ale#indicator_checking"]}',
    \ }
  ]]
end

set_lightline_ale_indicators()

-- Nonaktifkan highlight ALE
vim.g.ale_set_highlights = 0

-- Atur warna highlight ALEWarning
vim.cmd("highlight ALEWarning ctermbg=DarkMagenta")

-- Konfigurasi pesan ALE
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'

vim.g.ale_floating_window_border = { '│', '─', '╭', '╮', '╯', '╰', '│', '─' }
