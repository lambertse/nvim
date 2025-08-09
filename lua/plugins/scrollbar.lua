-- Install nvim-scrollbar plugin
-- Add this to your plugin manager (e.g., lazy.nvim, packer, etc.)
return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "kevinhwang91/nvim-hlslens", -- For search integration
        "lewis6991/gitsigns.nvim" -- For git integration
    },
    config = function()
        local scrollbar = require("scrollbar")

        -- Define colors manually or get them from your colorscheme
        local colors = {
            bg_highlight = "#2d3748",
            white = "#ffffff",
            orange = "#ff8800",
            error = "#ff5555",
            warning = "#ffb86c",
            info = "#8be9fd",
            hint = "#50fa7b",
            purple = "#bd93f9",
            git_add = "#50fa7b",
            git_change = "#ffb86c",
            git_delete = "#ff5555"
        }

        -- Alternative: Get colors from highlight groups
        local function get_hl_color(group, attr)
            local hl = vim.api.nvim_get_hl_by_name(group, true)
            if hl and hl[attr] then
                return string.format("#%06x", hl[attr])
            end
            return nil
        end

        -- Try to get colors from existing highlight groups, fallback to manual colors
        colors.error = get_hl_color("DiagnosticError", "foreground") or
                           colors.error
        colors.warning = get_hl_color("DiagnosticWarn", "foreground") or
                             colors.warning
        colors.info = get_hl_color("DiagnosticInfo", "foreground") or
                          colors.info
        colors.hint = get_hl_color("DiagnosticHint", "foreground") or
                          colors.hint
        colors.orange = get_hl_color("Search", "background") or colors.orange

        scrollbar.setup({
            show = true,
            show_in_active_only = false,
            set_highlights = true,
            folds = 1000,
            max_lines = false,
            hide_if_all_visible = false,
            throttle_ms = 100,
            handle = {
                text = "  ",
                blend = 30,
                color = colors.bg_highlight,
                color_nr = nil,
                highlight = "CursorColumn",
                hide_if_all_visible = true
            },
            marks = {
                Cursor = {
                    text = " ●",
                    priority = 0,
                    gui = nil,
                    color = colors.white,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "Normal"
                },
                Search = {
                    text = {"─", "═"},
                    priority = 1,
                    gui = nil,
                    color = colors.orange,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "Search"
                },
                Error = {
                    text = {"─", "═"},
                    priority = 2,
                    gui = nil,
                    color = colors.error,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "DiagnosticVirtualTextError"
                },
                Warn = {
                    text = {"─", "═"},
                    priority = 3,
                    gui = nil,
                    color = colors.warning,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "DiagnosticVirtualTextWarn"
                },
                Info = {
                    text = {"─", "═"},
                    priority = 4,
                    gui = nil,
                    color = colors.info,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "DiagnosticVirtualTextInfo"
                },
                Hint = {
                    text = {"─", "═"},
                    priority = 5,
                    gui = nil,
                    color = colors.hint,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "DiagnosticVirtualTextHint"
                },
                Misc = {
                    text = {"─", "═"},
                    priority = 6,
                    gui = nil,
                    color = colors.purple,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "Normal"
                },
                GitAdd = {
                    text = "┆",
                    priority = 7,
                    gui = nil,
                    color = colors.git_add,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "GitSignsAdd"
                },
                GitChange = {
                    text = "┆",
                    priority = 7,
                    gui = nil,
                    color = colors.git_change,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "GitSignsChange"
                },
                GitDelete = {
                    text = "▁",
                    priority = 7,
                    gui = nil,
                    color = colors.git_delete,
                    cterm = nil,
                    color_nr = nil,
                    highlight = "GitSignsDelete"
                }
            },
            excluded_buftypes = {"terminal"},
            excluded_filetypes = {
                "cmp_docs", "cmp_menu", "noice", "prompt", "TelescopePrompt",
                "alpha"
            },
            autocmd = {
                render = {
                    "BufWinEnter", "TabEnter", "TermEnter", "WinEnter",
                    "CmdwinLeave", "TextChanged", "VimResized", "WinScrolled"
                },
                clear = {"BufWinLeave", "TabLeave", "TermLeave", "WinLeave"}
            },
            handlers = {
                cursor = true,
                diagnostic = true,
                gitsigns = true,
                handle = true,
                search = true,
                ale = false
            }
        })

        -- Integration with hlslens for search
        require("scrollbar.handlers.search").setup({
            -- hlslens config overrides
        })

        -- Integration with gitsigns
        require("scrollbar.handlers.gitsigns").setup()
    end
}
