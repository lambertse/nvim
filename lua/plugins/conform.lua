return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
        lua = { "stylua" },
        c = { "clang-format" },
        java = { "google-java-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=Google" },
        },

        ["google-java-format"] = {
          -- Use --aosp for 4-space indent; omit for the default 2-space Google style.
          prepend_args = {},
        },

        ["lua-format"] = { command = "lua-format" },
      },
    }
    return opts
  end,
}

-- Format with lua: brew install fish
