return {
    "mfussenegger/nvim-lint",
    event = {"BufReadPost", "BufWritePost"},
    config = function()
        local lint = require("lint")

        -- -- Configure linters per filetype
        -- lint.linters_by_ft = {
        --     cpp = {"clangtidy", "cppcheck"} -- or "cppcheck"
        -- }

        -- Auto-run lint on save or text change
        vim.api.nvim_create_autocmd({
            "BufWritePost", "BufReadPost", "InsertLeave"
        }, {callback = function() lint.try_lint() end})
    end
}

