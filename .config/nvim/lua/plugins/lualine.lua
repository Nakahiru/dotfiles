local foo = function()
  return " " .. os.date("%R")
end

return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = {
        -- component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_z = {
          { foo, separator = { right = "" }, left_padding = 2 },
        },
      },
    },
  },
}
