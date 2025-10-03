return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = { "/Users/julien/Documents/prestashop/dev/PrestaShop" },
              },
              -- initializationOptions = {
              --   licenceKey = "INTELEPHENSE_LICENCE_KEY",
              -- },
            },
          },
        },
      })
    end,
  },
}
