return {
  -- fix for https://github.com/LazyVim/LazyVim/discussions/1832
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- Insert parentheses after selecting method/function
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "onsails/lspkind-nvim",
      "windwp/nvim-autopairs",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      opts.formatting = {
        fields = { "abbr", "kind", "menu" },

        format = lspkind.cmp_format({
          mode = "symbol_text", -- show only symbol annotations
          preset = "codicons",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,

          before = function(entry, vim_item)
            return vim_item
          end,
        }),
      }

      opts.experimental = {
        ghost_text = false,
      }

      opts.completion = {
        completeopt = "menu,menuone,noselect",
      }

      opts.window = {
        -- completion = {
        --   side_padding = 1,
        --   winblend = 2, -- transparency
        --   -- col_offset = -3, -- move window to left or right
        --   winhighlight = "Normal:CmpPmenu,Search:None,FloatBorder:Normal",
        --   scrollbar = true,
        --   border = "rounded", -- single|rounded|none
        -- },
        -- documentation = {
        --   border = "rounded",
        --   winhighlight = "Normal:CmpPmenu,FloatBorder:Normal",
        -- },
      }

      opts.mapping = {
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s", "c" }),
        ["<C-n>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
        }),
        ["<C-p>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end,
        }),
      }

      -- using table.insert in order to avoid delete upper sources configuration define by lazyvim
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
