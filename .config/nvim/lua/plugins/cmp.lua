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
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      -- local lspkind = require("lspkind")
      -- local function border(hl_name)
      --   return {
      --     { "╭", hl_name },
      --     { "─", hl_name },
      --     { "╮", hl_name },
      --     { "│", hl_name },
      --     { "╯", hl_name },
      --     { "─", hl_name },
      --     { "╰", hl_name },
      --     { "│", hl_name },
      --   }
      -- end

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      }

      opts.experimental = {
        ghost_text = false,
      }

      opts.completion = {
        completeopt = "menu,menuone,noselect",
      }

      opts.window = {
        completion = {
          side_padding = 0,
          -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          scrollbar = true,
        },
        documentation = {
          -- border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpDoc",
        },
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
