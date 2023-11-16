local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

local helpers = require("null-ls.helpers")
local FORMATTING = require("null-ls.methods").internal.FORMATTING
require("null-ls").register({
  --your custom sources go here
  helpers.make_builtin({
    name = "htmlbeautifier",
    meta = {
      url = "https://github.com/threedaymonk/htmlbeautifier",
      description =
      "A normaliser/beautifier for HTML that also understands embedded Ruby. Ideal for tidying up Rails templates."
    },
    method = FORMATTING,
    filetypes = { "eruby" },
    generator_opts = {
      command = "htmlbeautifier",
      args = {},       -- put any required arguments in this table
      to_stdin = true, -- instructs the command to ingest the file from STDIN (i.e. run the currently open buffer through the linter/formatter)
    },
    factory = helpers.formatter_factory,
  })
})
