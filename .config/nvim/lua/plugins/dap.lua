return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "BufReadPre", -- <-- this
    },
  },
  opts = function()
    local dap = require("dap")

    dap.configurations.php = {
      {
        name = "Php prestashop",
        type = "php",
        request = "launch",
        port = "9003",
        pathMappings = {
          ["/var/www/html"] = "${workspaceFolder}",
        },
      },
    }
  end,
}
