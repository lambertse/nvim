-- Line Number Configuration Options
local opt = vim.opt
local gb = vim.g

gb.autoformat = false
-- === LINE NUMBER SETTINGS ===

-- Basic line number display
opt.number = true -- Show absolute line numbers
opt.relativenumber = false -- Disable relative line numbers (as requested)

-- Line number column appearance
opt.numberwidth = 4 -- Minimum width of number column (default: 4)
opt.signcolumn = "yes" -- Always show sign column to prevent text shifting

-- Cursor line highlighting
opt.cursorline = true -- Highlight the current line
opt.cursorlineopt = "both" -- Highlight both line and number ("line", "number", or "both")

-- === RELATED DISPLAY OPTIONS ===

-- These affect how line numbers appear and interact with other elements
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
opt.wrap = false -- Don't wrap long lines (affects line number alignment)
opt.linebreak = true -- Break lines at word boundaries if wrap is enabled
opt.showbreak = "↪ " -- String to show at the start of wrapped lines

-- Fold settings (affects line number display in folded areas)
opt.foldcolumn = "1" -- Show fold column (0-12, or "auto")
opt.foldenable = true -- Enable folding
opt.foldlevel = 99 -- High fold level (don't fold by default)
opt.foldlevelstart = 99 -- Start with all folds open

-- === ADDITIONAL VISUAL HELPERS ===

-- Ruler and status
opt.ruler = true -- Show cursor position in status line
opt.laststatus = 3 -- Global statusline (2 = always show, 3 = global)

-- Whitespace and special characters
opt.list = false -- Don't show invisible characters by default
opt.listchars = { -- Define how to show invisible chars when 'list' is on
    tab = "→ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "⦸",
    eol = "↴"
}

-- Search highlighting (affects line number visibility during search)
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show search matches as you type

-- === PERFORMANCE OPTIONS ===

-- These can affect line number rendering performance
opt.updatetime = 200 -- Faster completion and cursor hold events
opt.redrawtime = 10000 -- Time to spend on syntax highlighting
opt.synmaxcol = 300 -- Don't highlight lines longer than this
opt.lazyredraw = false -- Don't redraw during macros (can affect line numbers)

-- === WINDOW AND BUFFER OPTIONS ===

-- Split behavior (affects line numbers in splits)
opt.splitbelow = true -- Open horizontal splits below
opt.splitright = true -- Open vertical splits to the right
opt.equalalways = false -- Don't auto-resize windows

-- Buffer switching
opt.hidden = true -- Allow switching buffers without saving
opt.confirm = true -- Ask for confirmation instead of error

-- === MOUSE AND INTERACTION ===

opt.mouse = "a" -- Enable mouse in all modes
opt.mousemodel = "popup" -- Right mouse button opens popup menu
opt.mousescroll = "ver:3,hor:6" -- Scroll speed
opt.smoothscroll = true -- Smooth scrolling (Neovim 0.10+)

-- Better scroll behavior
opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8 -- === BACKUP AND SWAP FILES ===

-- These don't affect line numbers but are commonly configured
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before overwriting
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Enable persistent undo

-- === SEARCH AND REPLACE ===

opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Case-sensitive if uppercase present
opt.gdefault = true -- Use 'g' flag by default in substitutions

-- === COMPLETION ===

opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10 -- Maximum height of popup menu
opt.pumwidth = 15 -- Minimum width of popup menu

-- === INDENTATION (affects visual alignment with line numbers) ===

opt.tabstop = 4 -- Number of spaces for a tab
opt.shiftwidth = 4 -- Number of spaces for each indent level
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line

-- === TIMEOUT SETTINGS ===

opt.timeout = true -- Enable timeouts
opt.timeoutlen = 300 -- Time to wait for mapped sequence
opt.ttimeoutlen = 0 -- Time to wait for key code sequence

-- === CLIPBOARD ===

opt.clipboard = "unnamedplus" -- Use system clipboard

-- === TERMINAL ===

opt.termguicolors = true -- Enable 24-bit RGB colors
opt.title = true -- Set terminal title
