return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          -- accept = "<Tab>",
          accept = false,
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },
}
