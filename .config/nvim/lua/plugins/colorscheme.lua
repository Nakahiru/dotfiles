return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-latte", -- light
      -- colorscheme = "catppuccin-mocha", -- dark
      -- colorscheme = "rose-pine",
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-macchiato",
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- opts = { style = "moon" },
    -- opts = { style = "day" },
    opts = {
      style = "night", -- day | moon | night
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },
}
