return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      -- {
      --   "<leader>sw",
      --   LazyVim.pick("grep_string", { hidden = true, only_sort_text = true, word_match = "-w" }),
      --   desc = "Word (Root Dir)",
      -- },
      -- {
      --   "<leader><leader>",
      --   LazyVim.pick("find_files", { hidden = true }),
      --   desc = "Find files",
      -- },
      -- {
      --   "<leader>fg",
      --   LazyVim.pick("git_files"),
      --   desc = "Git files",
      -- },
      -- { "<leader>/", LazyVim.pick("live_grep", {}), desc = "Grep (Root Dir)" },
    },
    opts = function(_, opts)
      opts.defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "descending",
        theme = "ivy",
        -- winblend = 0,
      }

      opts.pickers = {
        live_grep = {
          theme = "ivy",
          additional_args = function()
            return { "--hidden" }
          end,
        },
        find_files = {
          previewer = false,
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-x>"] = "delete_buffer",
            },
          },
        },
        git_files = {
          previewer = false,
        },
      }
    end,
    -- opts = {
    --   defaults = {
    --     layout_strategy = "vertical",
    --     layout_config = { prompt_position = "top" },
    --     sorting_strategy = "ascending",
    --     -- winblend = 0,
    --   },
    --   pickers = {
    --     live_grep = {
    --       additional_args = function()
    --         return { "--hidden" }
    --       end,
    --     },
    --     find_files = {
    --       previewer = false,
    --     },
    --     git_files = {
    --       previewer = false,
    --     },
    --   },
    -- },
  },
}
