return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path()
      --   .. "/node_modules/@vue/language-server"
      --   .. "/node_modules/@vue/typescript-plugin"
      --
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        --   volar = {
        --     init_options = {
        --       vue = {
        --         hybridMode = true, -- set it to true (it's the default value but lazyvim put it as false)
        --       },
        --     },
        --   },
        --   -- Volar 2.0 has discontinued their "take over mode" which in previous version provided support for typescript in vue files.
        --   -- The new approach to get typescript support involves using the typescript language server along side volar.
        --   vtsls = {
        --     filetypes = {
        --       "javascript",
        --       "javascriptreact",
        --       "javascript.jsx",
        --       "typescript",
        --       "typescriptreact",
        --       "typescript.tsx",
        --       "vue",
        --     },
        --     settings = {
        --       typescript = {
        --         updateImportsOnFileMove = { enabled = "always" },
        --         experimental = {
        --           completion = {
        --             enableServerSideFuzzyMatch = true,
        --           },
        --         },
        --         suggest = {
        --           completeFunctionCalls = true,
        --         },
        --         inlayHints = {
        --           enumMemberValues = { enabled = true },
        --           functionLikeReturnTypes = { enabled = true },
        --           parameterNames = { enabled = "all" },
        --           parameterTypes = { enabled = true },
        --           propertyDeclarationTypes = { enabled = true },
        --           variableTypes = { enabled = false },
        --         },
        --       },
        --       javascript = {
        --         updateImportsOnFileMove = { enabled = "always" },
        --         experimental = {
        --           completion = {
        --             enableServerSideFuzzyMatch = true,
        --           },
        --         },
        --         suggest = {
        --           completeFunctionCalls = true,
        --         },
        --         inlayHints = {
        --           enumMemberValues = { enabled = true },
        --           functionLikeReturnTypes = { enabled = true },
        --           parameterNames = { enabled = "all" },
        --           parameterTypes = { enabled = true },
        --           propertyDeclarationTypes = { enabled = true },
        --           variableTypes = { enabled = false },
        --         },
        --       },
        --     },
        --   },

        -- tsserver = {
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "javascript.jsx",
        --     "typescript",
        --     "typescriptreact",
        --     "typescript.tsx",
        --     "vue",
        --   },
        --   settings = {
        --     typescript = {
        --       inlayHints = {
        --         includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --         includeInlayVariableTypeHints = true,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --       },
        --     },
        --     javascript = {
        --       inlayHints = {
        --         includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --         includeInlayVariableTypeHints = true,
        --
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --       },
        --     },
        --   },
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = vue_typescript_plugin,
        --         languages = { "vue" },
        --       },
        --     },
        --   },
        -- },
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

      -- LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      --   name = "@vue/typescript-plugin",
      --   location = vue_typescript_plugin,
      --   languages = { "vue" },
      --   configNamespace = "typescript",
      -- })
    end,
  },
}
