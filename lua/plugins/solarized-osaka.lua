return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("solarized-osaka").setup({
      on_highlights = function(hl, colors)
        hl.Visual = {
          bg = colors.yellow100,
          fg = colors.none,
        }
      end,
    })
    vim.cmd([[colorscheme solarized-osaka]])
  end,
}
