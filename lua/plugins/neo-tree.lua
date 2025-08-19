return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons" -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
            require('neo-tree').setup({
                filesystem = {filtered_items = {hide_dotfiles = false}}
            })
            vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>',
                           {})
        end

    }
}
