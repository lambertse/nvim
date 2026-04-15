return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    vim.api.nvim_command("highlight DashboardHeader guifg=#C15F3C")
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          "",
          "",
          " ▐▛███▜▌   Minh-Tri Le v0.0.1                                               ",
          "▝▜█████▛▘  Lambert · Software Engineer                                      ",
          "  ▘▘ ▝▝    /lambertse                                                       ",
          "",
          "",
          "██╗      █████╗ ███╗   ███╗██████╗ ███████╗██████╗ ████████╗███████╗███████╗",
          "██║     ██╔══██╗████╗ ████║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝",
          "██║     ███████║██╔████╔██║██████╔╝█████╗  ██████╔╝   ██║   ███████╗█████╗  ",
          "██║     ██╔══██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗   ██║   ╚════██║██╔══╝  ",
          "███████╗██║  ██║██║ ╚═╝ ██║██████╔╝███████╗██║  ██║   ██║   ███████║███████╗",
          "╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝",
          "",
          "",
          "",
        },
        project = { enable = false },
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "  Tree",
            group = "DiagnosticHint",
            action = "Neotree toggle",
            key = "e",
          },
          {
            desc = " Strings",
            group = "Label",
            action = "Telescope live_grep",
            key = "s",
          },
          {
            desc = " Quit",
            group = "Constant",
            action = "q",
            key = "q",
          },
        },
        footer = {
          "",
          "Minh-Tri Le",
          "",
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
