return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = function(_, opts)
      return {
        files = {
          winopts = {
            preview = {
              hidden = "hidden",
            },
          },
        },
        buffers = {
          winopts = {
            preview = {
              hidden = "hidden",
            },
          },
        },
      }
    end,
  },
}
