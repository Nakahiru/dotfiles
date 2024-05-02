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
      opts.presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        lsp_doc_border = true, -- add a border to hover docs and signature help
      }
    end,
  },
}
