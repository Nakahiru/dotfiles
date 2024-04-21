return {
  -- add rose-pine
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load rose-pine
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "rose-pine-moon",
      colorscheme = "rose-pine-moon",
    },
  },

  -- {
  --   "catppuccin/nvim",
  -- },
  --
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin-frappe",
  --     -- colorscheme = "catppuccin-latte",
  --   },
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  -- },
}
