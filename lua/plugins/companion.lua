return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim", branch = "master"},
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {adapter = "copilot"},
                inline = {adapter = "copilot"}
            },
            opts = {log_level = "DEBUG"}
        })
    end
}
