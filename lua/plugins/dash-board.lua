return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      vim.api.nvim_command('highlight DashboardHeader guifg=#F39939')
      require('dashboard').setup{
        theme = 'hyper',
        config = {
          header = {
                '',
                '██╗      █████╗ ███╗   ███╗██████╗ ███████╗██████╗ ████████╗███████╗███████╗',
                '██║     ██╔══██╗████╗ ████║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝',
                '██║     ███████║██╔████╔██║██████╔╝█████╗  ██████╔╝   ██║   ███████╗█████╗  ',
                '██║     ██╔══██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗   ██║   ╚════██║██╔══╝  ',
                '███████╗██║  ██║██║ ╚═╝ ██║██████╔╝███████╗██║  ██║   ██║   ███████║███████╗',
                '╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝',
                '',
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = '  Tree',
              group = 'DiagnosticHint',
              action = 'Neotree toggle',
              key = 'e',
            },
            {
              desc = ' Strings',
              group = 'Label',
              action = 'Telescope live_grep',
              key = 's',
            },
            {
              desc = ' Quit',
              group = 'Constant',
              action = 'q',
              key = 'q',
            },
          },
        },
      }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

