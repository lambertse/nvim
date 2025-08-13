return {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
    build = "cd app && yarn install",
    init = function()
        -- Auto start preview when opening markdown
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_browser = "firefox" -- works well on Hyprland
        vim.g.mkdp_theme = "dark"
        vim.g.mkdp_filetypes = {"markdown"}
    end,
    ft = {"markdown"}
}

