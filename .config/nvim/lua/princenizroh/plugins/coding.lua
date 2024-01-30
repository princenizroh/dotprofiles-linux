local coding_plugin = {
  {
   'numToStr/Comment.nvim',
   lazy = false,
   opts = {
     opleader = {
       line = "gc",
       block = "gb",
     }
   }
 },
 {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestions = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
}

return coding_plugin

