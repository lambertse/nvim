return {
    "stevearc/conform.nvim",
    opts = function()
        local opts = {
            formatters_by_ft = {cpp = {"clang-format"}, lua = {"lua-format"}},
            formatters = {
                ["clang-format"] = {
                    command = "clang-format",
                    args = {"--style=Google"}
                }
            }
        }
        return opts
    end
}
