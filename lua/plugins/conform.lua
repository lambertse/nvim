return {
    "stevearc/conform.nvim",
    opts = function()
        local opts = {
            formatters_by_ft = {cpp = {"clang-format"}, lua = {"lua-format"}, c = {"clang-format"}},
            formatters = {
                ["clang-format"] = {
                    command = "clang-format",
                    args = {"--style=Google"}
                },
                ["lua-format"] = {command = "lua-format"},
            }
        }
        return opts
    end
}

-- Format with lua: brew install fish
