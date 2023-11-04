local status, omnisharp = pcall(require, "omnisharp-vim")
if (not status) then return end

omnisharp.setup {
  enabled = true,
  Omnisharp_start_server = 1,
  Omnisharp_server_stdio = 1,
  OmniSharp_server_use_net6 = 1,
  OmniSharp_server_use_mono = 1,
  OmniSharp_selector_ui = 'fzf',
  OmniSharp_selector_findusages = 'fzf',
  OmniSharp_highlighting = 3,
  OmniSharp_highlight_groups = {
    Comment = 'NonText',
    XmlDocCommentName = 'Identifier',
    XmlDocCommentText = 'NonText'
  },
  OmniSharp_diagnostic_overrides = {
    IDE0010 = { type = 'I' },
    IDE0055 = { type = 'W', subtype = 'Style' },
    CS8019 = { type = 'None' },
    RemoveUnnecessaryImportsFixable = { type = 'None' }
  },
  OmniSharp_diagnostic_exclude_paths = {
    'obj\\',
    '[Tt]emp\\',
    '\\.nuget\\',
    '\\<AssemblyInfo.cs\\>',
  },
  OmniSHarp_popup = 0,
  popup_position = 'peek',
  popup_options = {
    winblend = 30,
    winhl = 'Normal:Normal,FloatBorder:Special',
    border = 'rounded',
    highlight = 'Normal',
    padding = { 1 },
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    borderhighlight = { 'Special' }
  },
  popup_mappings = {
    sigNext = '<C-n>',
    sigPrev = '<C-p>',
    lineDown = { '<C-e>', 'j' },
    lineUp = { '<C-y>', 'k' }
  },
}
