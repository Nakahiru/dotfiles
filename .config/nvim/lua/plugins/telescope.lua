return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sw",
        LazyVim.telescope("grep_string", { only_sort_text = true, word_match = "-w" }),
        desc = "Word (Root Dir)",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        -- winblend = 0,
      },
      pickers = {
        find_files = {
          previewer = false,
        },
        git_files = {
          previewer = false,
        },
      },
    },
  },
}
