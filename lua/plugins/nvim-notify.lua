return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        prority = 999,
        config = function()
            local notify = require("notify")
            -- Make notify the default for vim.notify
            vim.notify = require("notify")
        end
    }
}

