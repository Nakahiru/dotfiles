return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          find = "Ignoring completion, line number is not the current line.",
        },
        opts = { skip = true },
      })
      -- Filter all errors in vuejs regarding inlay hints
      -- those errors are not impacting the experience
      -- table.insert(opts.routes, {
      --   filter = {
      --     find = "Error in decoration provider vim_lsp_inlayhint.win",
      --   },
      --   opts = { skip = true },
      -- })
      opts.presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        lsp_doc_border = true, -- add a border to hover docs and signature help
        command_palette = true, -- position the cmdline and popupmenu together
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },
}
