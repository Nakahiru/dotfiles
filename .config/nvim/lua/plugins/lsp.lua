return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      setup = {
        tsserver = function(_, opts)
          local mason_registry = require("mason-registry")
          local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
            .. "/node_modules/@vue/language-server"

          opts.init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
              },
            },
          }
          opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
        end,
      },
      inlay_hints = { enabled = false },
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
        volar = {},
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayVariableTypeHints = true,

                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            preferences = {
              hostInfo = "neovim",
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "relative",
              importModuleSpecifier = "relative",
            },
          },
          init_options = {
            -- preferences = {
            --   hostInfo = "neovim",
            --   includeCompletionsForModuleExports = true,
            --   includeCompletionsForImportStatements = true,
            --   importModuleSpecifierPreference = "relative",
            --   importModuleSpecifier = "relative",
            -- },
          },
        },
      },
    },
  },
}
