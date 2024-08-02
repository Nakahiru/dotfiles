return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      coloumns = { "icon" },
      keymaps = {
        -- ["q"] = "actions.close", <- disable this one because cannot use macro otherwise
        -- ["<esc>"] = "actions.close", <- disable this because when pressing esc for exit visual mode
        -- it will also quit oil window
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,

  -- Open parent directory in current window
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory " }),

  -- Open parent directory in floating window
  -- vim.keymap.set("n", "<space>-", "<CMD>Oil<CR>", { desc = "Open parent directory " }),
}
