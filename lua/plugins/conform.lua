return {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          cpp = { "clang-format" },
          lua = { "lua-format" },
      },
    }
    return opts
  end,
} 
