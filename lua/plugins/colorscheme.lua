return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Base Solarized Osaka setup
            require("solarized-osaka").setup({
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = {italic = true},
                    keywords = {italic = true, bold = false},
                    functions = {bold = true},
                    variables = {},
                    sidebars = "dark",
                    floats = "dark"
                },
                sidebars = {
                    "qf", "help", "vista_kind", "terminal", "packer",
                    "spectre_panel", "NeogitStatus", "DiffviewFiles"
                },
                day_brightness = 0.3,
                hide_inactive_statusline = false,
                dim_inactive = true,
                lualine_bold = true
            })

            -- Set the default colorscheme
            vim.cmd([[colorscheme solarized-osaka]])

            -- Create custom "moon" variant (medium contrast, cooler tones)
            local function apply_moon_variant()
                vim.cmd([[colorscheme solarized-osaka]]) -- Start with base

                -- Custom moon colors (cooler, medium contrast)
                local moon_colors = {
                    bg = "#1a1b26", -- Slightly lighter than night
                    bg_dark = "#16161e", -- Darker background
                    bg_float = "#1a1b26", -- Float background
                    bg_highlight = "#292e42", -- Selection background
                    bg_popup = "#16161e", -- Popup background
                    bg_search = "#3d59a1", -- Search highlight
                    bg_sidebar = "#16161e", -- Sidebar background
                    bg_statusline = "#16161e", -- Statusline background
                    bg_visual = "#283457", -- Visual selection

                    fg = "#c0caf5", -- Main foreground (slightly blue-tinted)
                    fg_dark = "#a9b1d6", -- Darker foreground
                    fg_gutter = "#3b4261", -- Gutter foreground

                    -- Syntax colors with cooler tones
                    blue = "#7aa2f7", -- Functions, types
                    cyan = "#7dcfff", -- Preprocessor, special
                    green = "#73daca", -- Strings (more teal)
                    orange = "#ff9e64", -- Numbers, constants
                    purple = "#bb9af7", -- Keywords
                    red = "#f7768e", -- Errors, important
                    yellow = "#e0af68", -- Warnings, identifiers

                    -- Special moon colors
                    blue1 = "#2ac3de", -- Special blue
                    blue2 = "#0db9d7", -- Another blue variant
                    blue5 = "#89ddff", -- Light blue
                    blue6 = "#b4f9f8", -- Very light blue
                    blue7 = "#394b70", -- Dark blue

                    magenta = "#bb9af7", -- Magenta variant
                    magenta2 = "#ff007c", -- Bright magenta

                    comment = "#565f89", -- Comments (cooler gray)
                    dark3 = "#545c7e", -- Dark variant
                    dark5 = "#737aa2", -- Medium dark

                    none = "NONE"
                }

                -- Apply moon-specific highlights
                local highlights = {
                    Normal = {fg = moon_colors.fg, bg = moon_colors.bg},
                    NormalFloat = {
                        fg = moon_colors.fg,
                        bg = moon_colors.bg_float
                    },
                    FloatBorder = {
                        fg = moon_colors.blue1,
                        bg = moon_colors.bg_float
                    },

                    -- Enhanced C++ highlighting for moon theme
                    ["@function.cpp"] = {fg = moon_colors.blue, bold = true},
                    ["@type.cpp"] = {fg = moon_colors.blue1},
                    ["@type.builtin.cpp"] = {
                        fg = moon_colors.orange,
                        bold = true
                    },
                    ["@keyword.function.cpp"] = {
                        fg = moon_colors.magenta,
                        bold = true
                    },
                    ["@string.cpp"] = {fg = moon_colors.green},
                    ["@number.cpp"] = {fg = moon_colors.orange},
                    ["@comment.cpp"] = {fg = moon_colors.comment, italic = true},
                    ["@preproc.cpp"] = {fg = moon_colors.cyan, bold = true},

                    -- UI elements
                    StatusLine = {
                        fg = moon_colors.fg,
                        bg = moon_colors.bg_statusline
                    },
                    TabLine = {
                        fg = moon_colors.fg_dark,
                        bg = moon_colors.bg_dark
                    },
                    TabLineFill = {bg = moon_colors.bg_dark},
                    TabLineSel = {fg = moon_colors.fg, bg = moon_colors.bg},

                    -- Telescope
                    TelescopeNormal = {
                        fg = moon_colors.fg,
                        bg = moon_colors.bg_float
                    },
                    TelescopeBorder = {
                        fg = moon_colors.blue1,
                        bg = moon_colors.bg_float
                    },
                    TelescopeSelection = {
                        fg = moon_colors.fg,
                        bg = moon_colors.bg_highlight,
                        bold = true
                    },

                    -- Tree-sitter
                    ["@variable"] = {fg = moon_colors.fg},
                    ["@parameter"] = {fg = moon_colors.orange, italic = true},
                    ["@constant"] = {fg = moon_colors.orange, bold = true},
                    ["@operator"] = {fg = moon_colors.cyan}
                }

                for group, opts in pairs(highlights) do
                    vim.api.nvim_set_hl(0, group, opts)
                end
            end

            -- Create custom "night" variant (high contrast, warmer darks)
            local function apply_night_variant()
                vim.cmd([[colorscheme solarized-osaka]]) -- Start with base

                -- Custom night colors (darker, higher contrast)
                local night_colors = {
                    bg = "#0d1117", -- Very dark background
                    bg_dark = "#010409", -- Almost black
                    bg_float = "#161b22", -- Float background
                    bg_highlight = "#21262d", -- Selection background
                    bg_popup = "#0d1117", -- Popup background
                    bg_search = "#1f6feb", -- Search highlight
                    bg_sidebar = "#010409", -- Sidebar background
                    bg_statusline = "#21262d", -- Statusline background
                    bg_visual = "#264466", -- Visual selection

                    fg = "#f0f6fc", -- Bright foreground
                    fg_dark = "#8b949e", -- Darker foreground
                    fg_gutter = "#30363d", -- Gutter foreground

                    -- Syntax colors with high contrast
                    blue = "#58a6ff", -- Bright blue for functions
                    cyan = "#39d0d8", -- Bright cyan
                    green = "#56d364", -- Bright green for strings
                    orange = "#ffa657", -- Bright orange
                    purple = "#bc8cff", -- Bright purple
                    red = "#ff7b72", -- Bright red
                    yellow = "#f2cc60", -- Bright yellow

                    -- Special night colors
                    blue1 = "#79c0ff", -- Light blue
                    blue2 = "#1f6feb", -- Medium blue

                    magenta = "#d2a8ff", -- Bright magenta

                    comment = "#7c8b9a", -- Updated: Brighter, more readable comment color
                    dark3 = "#21262d", -- Dark variant
                    dark5 = "#30363d", -- Medium dark

                    none = "NONE"
                }

                -- Apply night-specific highlights
                local highlights = {
                    Normal = {fg = night_colors.fg, bg = night_colors.bg},
                    NormalFloat = {
                        fg = night_colors.fg,
                        bg = night_colors.bg_float
                    },
                    FloatBorder = {
                        fg = night_colors.blue1,
                        bg = night_colors.bg_float
                    },

                    -- Enhanced C++ highlighting for night theme
                    ["@function.cpp"] = {fg = night_colors.blue, bold = true},
                    ["@type.cpp"] = {fg = night_colors.blue1, bold = true},
                    ["@type.builtin.cpp"] = {
                        fg = night_colors.orange,
                        bold = true
                    },
                    ["@keyword.function.cpp"] = {
                        fg = night_colors.purple,
                        bold = true
                    },
                    ["@string.cpp"] = {fg = night_colors.green},
                    ["@number.cpp"] = {fg = night_colors.orange},
                    ["@comment.cpp"] = {
                        fg = night_colors.comment,
                        italic = true
                    },
                    ["@preproc.cpp"] = {fg = night_colors.cyan, bold = true},
                    ["@constant.macro.cpp"] = {
                        fg = night_colors.red,
                        bold = true
                    },

                    -- UI elements with high contrast= { fg = night_colors.yellow, bold = true },
                    GitSignsDelete = {fg = night_colors.red, bold = true}
                }

                for group, opts in pairs(highlights) do
                    vim.api.nvim_set_hl(0, group, opts)
                end
            end

            -- Theme switching keymaps
            vim.keymap.set("n", "<leader>td", function()
                vim.cmd([[colorscheme solarized-osaka]])
            end, {desc = "Solarized Osaka (default dark)"})

            vim.keymap.set("n", "<leader>tl", function()
                vim.cmd([[colorscheme solarized-osaka-day]])
            end, {desc = "Solarized Osaka (light)"})

            vim.keymap.set("n", "<leader>tm", function()
                apply_moon_variant()
                vim.g.colors_name = "solarized-osaka-moon" -- Set custom name
                print("Applied Solarized Osaka Moon variant")
            end, {desc = "Custom Moon theme (medium contrast, cool tones)"})

            vim.keymap.set("n", "<leader>tn", function()
                apply_night_variant()
                vim.g.colors_name = "solarized-osaka-night" -- Set custom name
                print("Applied Solarized Osaka Night variant")
            end, {desc = "Custom Night theme (high contrast, dark)"})

            -- Smart toggle based on time (optional)
            vim.keymap.set("n", "<leader>ta", function()
                local hour = tonumber(os.date("%H"))
                if hour >= 6 and hour < 18 then
                    vim.cmd([[colorscheme solarized-osaka-day]])
                    print("Applied day theme (light)")
                elseif hour >= 18 and hour < 22 then
                    apply_moon_variant()
                    vim.g.colors_name = "solarized-osaka-moon"
                    print("Applied moon theme (evening)")
                else
                    apply_night_variant()
                    vim.g.colors_name = "solarized-osaka-night"
                    print("Applied night theme (late night)")
                end
            end, {desc = "Auto theme based on time"})

            -- Quick toggle between your custom variants
            vim.keymap.set("n", "<leader>tt", function()
                local current = vim.g.colors_name or "solarized-osaka"
                if current == "solarized-osaka" then
                    apply_moon_variant()
                    vim.g.colors_name = "solarized-osaka-moon"
                    print("Switched to Moon variant")
                elseif current == "solarized-osaka-moon" then
                    apply_night_variant()
                    vim.g.colors_name = "solarized-osaka-night"
                    print("Switched to Night variant")
                else
                    vim.cmd([[colorscheme solarized-osaka]])
                    print("Switched to Default variant")
                end
            end, {desc = "Cycle through custom variants"})
        end
    }, -- Configure LazyVim
    {"LazyVim/LazyVim", opts = {colorscheme = "solarized-osaka"}}
}

