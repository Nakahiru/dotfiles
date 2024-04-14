-- If you are using mason.nvim, you can get the ts_plugin_path like this
require("mason").setup()
local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = { "/Users/julien/Documents/prestashop/dev/PrestaShop" },
              },
              initializationOptions = {
                licenceKey = "INTELEPHENSE_LICENCE_KEY",
              },
            },
          },
        },
        volar = {
          setup = {
            filetypes = { "vue" },
          },
        },
        tsserver = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
      },
    },
  },
}
