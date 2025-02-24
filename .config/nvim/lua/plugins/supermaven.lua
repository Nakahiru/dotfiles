return {
  {
    "supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<C-o>",
        clear_suggestion = "<C-e>",
        accept_word = "<C-j>",
      },
      -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
      log_level = "info", -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false, -- disables built in keymaps for more manual control
    },
  },
}
