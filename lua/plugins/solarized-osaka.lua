return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("solarized-osaka").setup({
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },

      -- Override base palette to match Claude Code's warm dark aesthetic
      on_colors = function(colors)
        -- Claude Code backgrounds (warm dark browns instead of cold solarized blue)
        colors.bg = "#1a1815"
        colors.bg_dark = "#141210"
        colors.bg_highlight = "#242019"
        colors.bg_float = "#141210"
        colors.bg_popup = "#141210"
        colors.bg_sidebar = "#141210"
        colors.bg_statusline = "#1e1b17"

        -- Claude Code foreground (warm cream tones)
        colors.fg = "#e8e6e3"
        colors.fg_dark = "#c4a584"
        colors.fg_float = "#e8e6e3"

        -- Borders
        colors.border = "#3a352e"

        -- Claude brand accent: terracotta rust-orange
        colors.orange = "#C15F3C"
        colors.orange100 = "#FFB38A"
        colors.orange300 = "#E67D22"
        colors.orange500 = "#C15F3C"
        colors.orange700 = "#A14A2F"
        colors.orange900 = "#5C2A1A"

        -- Warm syntax colors inspired by Claude Code themes
        colors.yellow = "#D4A843"
        colors.yellow300 = "#E6C355"
        colors.yellow500 = "#D4A843"

        colors.green = "#98C379"
        colors.green300 = "#B5D89E"
        colors.green500 = "#98C379"

        colors.blue = "#61AFEF"
        colors.blue300 = "#7EC4FF"
        colors.blue500 = "#61AFEF"
        colors.blue700 = "#4A8BBF"

        colors.cyan = "#56B6C2"
        colors.cyan300 = "#79D0DA"
        colors.cyan500 = "#56B6C2"

        colors.violet = "#C678DD"
        colors.violet300 = "#D9A0EC"
        colors.violet500 = "#C678DD"

        colors.magenta = "#E06C9A"
        colors.magenta300 = "#F08CB0"
        colors.magenta500 = "#E06C9A"

        colors.red = "#E06C75"
        colors.red300 = "#F08C95"
        colors.red500 = "#E06C75"

        -- Diagnostics
        colors.error = "#E06C75"
        colors.warning = "#D4A843"
        colors.info = "#61AFEF"
        colors.hint = "#56B6C2"

        -- Git colors
        colors.git = {
          add = "#98C379",
          change = "#E67D22",
          delete = "#E06C75",
        }
      end,

      on_highlights = function(hl, colors)
        local claude_orange = "#C15F3C"
        local claude_bright = "#E67D22"
        local claude_light = "#FFB38A"
        local warm_bg = "#1a1815"
        local dark_bg = "#141210"
        local warm_border = "#3a352e"
        local cream = "#e8e6e3"
        local muted_tan = "#c4a584"

        -- ── Editor chrome ──────────────────────────────
        hl.Normal = { bg = warm_bg, fg = cream }
        hl.NormalFloat = { bg = dark_bg, fg = cream }
        hl.NormalSB = { bg = dark_bg, fg = cream }
        hl.FloatBorder = { fg = claude_orange, bg = dark_bg }
        hl.FloatTitle = { fg = claude_orange, bg = dark_bg, bold = true }
        hl.WinSeparator = { fg = warm_border }
        hl.VertSplit = { fg = warm_border }

        -- ── Cursor & visual ────────────────────────────
        hl.CursorLine = { bg = "#242019" }
        hl.CursorLineNr = { fg = claude_orange, bold = true }
        hl.Visual = { bg = "#3a2820" }
        hl.VisualNOS = { bg = "#3a2820" }

        -- ── Search ─────────────────────────────────────
        hl.Search = { bg = "#3a2a20", fg = colors.none }
        hl.IncSearch = { bg = claude_orange, fg = "#1a1815" }
        hl.CurSearch = { bg = claude_bright, fg = "#1a1815" }

        -- ── Line numbers & signs ───────────────────────
        hl.LineNr = { fg = "#4a4540" }
        hl.SignColumn = { bg = warm_bg }

        -- ── Pmenu (completion) ─────────────────────────
        hl.Pmenu = { bg = dark_bg, fg = cream }
        hl.PmenuSel = { bg = "#3a2820", fg = cream }
        hl.PmenuSbar = { bg = "#242019" }
        hl.PmenuThumb = { bg = claude_orange }

        -- ── Statusline ─────────────────────────────────
        hl.StatusLine = { bg = "#1e1b17", fg = muted_tan }
        hl.StatusLineNC = { bg = "#161411", fg = "#4a4540" }

        -- ── Tabline ────────────────────────────────────
        hl.TabLine = { bg = dark_bg, fg = muted_tan }
        hl.TabLineFill = { bg = dark_bg }
        hl.TabLineSel = { bg = warm_bg, fg = claude_orange, bold = true }

        -- ── Telescope ──────────────────────────────────
        local telescope_bg = dark_bg
        local prompt_bg = "#201d18"
        hl.TelescopeNormal = { bg = telescope_bg, fg = cream }
        hl.TelescopeBorder = { bg = telescope_bg, fg = claude_orange }
        hl.TelescopePromptNormal = { bg = prompt_bg, fg = cream }
        hl.TelescopePromptBorder = { bg = prompt_bg, fg = claude_orange }
        hl.TelescopePromptTitle = { bg = claude_orange, fg = dark_bg, bold = true }
        hl.TelescopePreviewTitle = { bg = claude_orange, fg = dark_bg, bold = true }
        hl.TelescopeResultsTitle = { bg = claude_orange, fg = dark_bg, bold = true }
        hl.TelescopeSelection = { bg = "#302218", fg = cream }
        hl.TelescopeMatching = { fg = claude_bright, bold = true }

        -- ── Treesitter syntax (Claude Code warm palette) ──
        hl["@keyword"] = { fg = claude_orange, italic = true }
        hl["@keyword.return"] = { fg = claude_orange, italic = true }
        hl["@keyword.function"] = { fg = claude_orange, italic = true }
        hl["@keyword.operator"] = { fg = claude_orange }
        hl["@conditional"] = { fg = claude_orange, italic = true }
        hl["@repeat"] = { fg = claude_orange, italic = true }
        hl["@include"] = { fg = claude_orange, italic = true }
        hl["@exception"] = { fg = claude_orange, italic = true }

        hl["@function"] = { fg = claude_light }
        hl["@function.call"] = { fg = claude_light }
        hl["@function.method"] = { fg = claude_light, italic = true }
        hl["@function.method.call"] = { fg = claude_light }

        hl["@string"] = { fg = "#98C379" }
        hl["@number"] = { fg = "#FF9966" }
        hl["@boolean"] = { fg = "#FF9966" }
        hl["@float"] = { fg = "#FF9966" }

        hl["@type"] = { fg = "#61AFEF" }
        hl["@type.builtin"] = { fg = "#61AFEF", italic = true }

        hl["@variable"] = { fg = cream }
        hl["@variable.parameter"] = { fg = muted_tan }
        hl["@variable.member"] = { fg = "#d4c4b0" }

        hl["@property"] = { fg = "#d4c4b0" }
        hl["@constant"] = { fg = "#D4A843" }
        hl["@constant.builtin"] = { fg = "#D4A843", italic = true }

        hl["@comment"] = { fg = "#6a6560", italic = true }
        hl["@punctuation"] = { fg = "#8a8580" }
        hl["@punctuation.bracket"] = { fg = "#8a8580" }
        hl["@punctuation.delimiter"] = { fg = "#8a8580" }

        hl["@operator"] = { fg = "#d4c4b0" }
        hl["@tag"] = { fg = claude_orange }
        hl["@tag.attribute"] = { fg = claude_light }
        hl["@tag.delimiter"] = { fg = "#8a8580" }

        -- ── LSP highlights ─────────────────────────────
        hl.DiagnosticError = { fg = "#E06C75" }
        hl.DiagnosticWarn = { fg = "#D4A843" }
        hl.DiagnosticInfo = { fg = "#61AFEF" }
        hl.DiagnosticHint = { fg = "#56B6C2" }

        hl.DiagnosticVirtualTextError = { fg = "#E06C75", bg = "#2a1a1a" }
        hl.DiagnosticVirtualTextWarn = { fg = "#D4A843", bg = "#2a2418" }
        hl.DiagnosticVirtualTextInfo = { fg = "#61AFEF", bg = "#1a2028" }
        hl.DiagnosticVirtualTextHint = { fg = "#56B6C2", bg = "#1a2525" }

        hl.LspReferenceText = { bg = "#282018" }
        hl.LspReferenceRead = { bg = "#282018" }
        hl.LspReferenceWrite = { bg = "#302418" }

        -- ── Indent & whitespace ────────────────────────
        hl.IndentBlanklineChar = { fg = "#2a2520" }
        hl.IblIndent = { fg = "#2a2520" }
        hl.IblScope = { fg = claude_orange }

        -- ── Git signs ──────────────────────────────────
        hl.GitSignsAdd = { fg = "#98C379" }
        hl.GitSignsChange = { fg = claude_bright }
        hl.GitSignsDelete = { fg = "#E06C75" }

        -- ── Diff ───────────────────────────────────────
        hl.DiffAdd = { bg = "#1e2a1e" }
        hl.DiffChange = { bg = "#2a2218" }
        hl.DiffDelete = { bg = "#2a1a1a" }
        hl.DiffText = { bg = "#3a2a18" }

        -- ── nvim-cmp ───────────────────────────────────
        hl.CmpItemAbbrMatch = { fg = claude_orange, bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = claude_bright }
        hl.CmpItemKindFunction = { fg = claude_light }
        hl.CmpItemKindMethod = { fg = claude_light }
        hl.CmpItemKindVariable = { fg = "#61AFEF" }
        hl.CmpItemKindKeyword = { fg = claude_orange }

        -- ── Notify ─────────────────────────────────────
        hl.NotifyERRORBorder = { fg = "#E06C75" }
        hl.NotifyWARNBorder = { fg = "#D4A843" }
        hl.NotifyINFOBorder = { fg = "#61AFEF" }
        hl.NotifyDEBUGBorder = { fg = muted_tan }
        hl.NotifyTRACEBorder = { fg = "#C678DD" }

        -- ── Which-key ──────────────────────────────────
        hl.WhichKey = { fg = claude_orange }
        hl.WhichKeyGroup = { fg = claude_light }
        hl.WhichKeyDesc = { fg = cream }
        hl.WhichKeySeparator = { fg = "#4a4540" }

        -- ── Dashboard / Alpha ──────────────────────────
        hl.DashboardHeader = { fg = claude_orange }
        hl.DashboardCenter = { fg = cream }
        hl.DashboardFooter = { fg = muted_tan }

        -- ── Lazy.nvim ──────────────────────────────────
        hl.LazyButton = { bg = "#242019", fg = cream }
        hl.LazyButtonActive = { bg = claude_orange, fg = dark_bg }
        hl.LazyH1 = { bg = claude_orange, fg = dark_bg, bold = true }

        -- ── Mini (if you use mini.nvim) ────────────────
        hl.MiniStatuslineModeNormal = { bg = claude_orange, fg = dark_bg, bold = true }
        hl.MiniStatuslineModeInsert = { bg = "#98C379", fg = dark_bg, bold = true }
        hl.MiniStatuslineModeVisual = { bg = "#C678DD", fg = dark_bg, bold = true }
        hl.MiniStatuslineModeCommand = { bg = "#D4A843", fg = dark_bg, bold = true }

        -- ── Lualine integration colors ─────────────────
        hl.lualine_a_normal = { bg = claude_orange, fg = dark_bg, bold = true }
        hl.lualine_a_insert = { bg = "#98C379", fg = dark_bg, bold = true }
        hl.lualine_a_visual = { bg = "#C678DD", fg = dark_bg, bold = true }
        hl.lualine_a_command = { bg = "#D4A843", fg = dark_bg, bold = true }
      end,
    })
    vim.cmd([[colorscheme solarized-osaka]])
  end,
}
