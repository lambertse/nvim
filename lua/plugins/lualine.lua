return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        event = 'VimEnter',
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = {left = '', right = ''},
                    section_separators = {left = '', right = ''},
                    disabled_filetypes = {'dashboard', 'alpha'},
                    always_divide_middle = true
                }
            }
        end
    }
}
