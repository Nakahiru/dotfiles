return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
      {
        "<leader>gn",
        vim.cmd.Neogit,
        desc = "Toggle neogit",
      },
    },
    config = true,
  },
}
