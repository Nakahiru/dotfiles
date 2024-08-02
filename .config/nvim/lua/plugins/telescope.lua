return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim",
    },
    -- config = function(_, opts)
    --   local fb_actions = require("telescope._extensions.file_browser.actions")
    --
    --   opts.extensions = {
    --     hijack_netrw = true,
    --     mappings = {
    --       ["n"] = {
    --         ["e"] = fb_actions.toggle_browser,
    --       },
    --     },
    --   }
    --
    --   opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
    --     layout_strategy = "vertical",
    --     layout_config = { prompt_position = "top" },
    --     sorting_strategy = "ascending",
    --     -- winblend = 0,
    --   })
    --
    --   opts.pickers = {
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
    --   }
    --
    --   require("telescope").load_extension("file_browser")
    -- end,
    keys = {
      {
        "<leader>sw",
        LazyVim.pick("grep_string", { hidden = true, only_sort_text = true, word_match = "-w" }),
        desc = "Word (Root Dir)",
      },
      {
        "<leader><leader>",
        LazyVim.pick("find_files", { hidden = true }),
        desc = "Find files",
      },
      { "<leader>/", LazyVim.pick("live_grep", {}), desc = "Grep (Root Dir)" },
    },
    opts = function(_, opts)
      opts.defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        -- winblend = 0,
      }

      opts.extensions = {
        file_browser = {
          hijack_netrw = true,
          grouped = true,
          select_buffer = true,
        },
      }

      opts.pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
        find_files = {
          previewer = false,
        },
        buffers = {
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
