return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- documentation = {
        --   auto_show = false,
        --   -- Delay before showing the documentation window
        --   auto_show_delay_ms = 500,
        --   -- Delay before updating the documentation window when selecting a new item,
        --   -- while an existing item is still visible
        --   update_delay_ms = 50,
        --   -- Whether to use treesitter highlighting, disable if you run into performance issues
        --   treesitter_highlighting = true,
        --   window = {
        --     min_width = 10,
        --     max_width = 60,
        --     max_height = 20,
        --     border = "padded",
        --     winblend = 0,
        --     winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        --     -- Note that the gutter will be disabled when border ~= 'none'
        --     scrollbar = true,
        --     -- Which directions to show the documentation window,
        --     -- for each of the possible menu window directions,
        --     -- falling back to the next direction when there's not enough space
        --     direction_priority = {
        --       menu_north = { "e", "w", "n", "s" },
        --       menu_south = { "e", "w", "s", "n" },
        --     },
        --   },
        -- },
        -- Displays a preview of the selected item on the current line
        ghost_text = {
          enabled = false,
        },
      },
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },
    },
  },
}
