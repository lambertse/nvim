local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- ========================================================================================
-- BASIC EDITING
-- ========================================================================================

-- Increment/decrement numbers
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete operations (send to black hole register to preserve clipboard)
keymap.set("n", "dw", '"_diw', opts)
keymap.set({"n", "v"}, "d", '"_d', opts)
keymap.set({"n", "v"}, "D", '"_D', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- ========================================================================================
-- CLIPBOARD OPERATIONS
-- ====================================/====================================================

-- Copy to system clipboard with Ctrl+C
keymap.set({"n", "v"}, "cc", '"+y', opts)

-- Paste from system clipboard with Ctrl+V
keymap.set("n", "cv", '"+P', opts)
keymap.set("v", "cv", '"_dP', opts)
-- Cut operations
keymap.set("v", "<C-x>", '"+d', opts) -- Cut selected text to system clipboard
keymap.set("n", "<C-x>", '"+dd', opts) -- Cut current line to system clipboard

-- Use 'p' in visual mode to paste without overwriting the default register

-- ========================================================================================
-- UNDO/REDO
-- ========================================================================================

keymap.set("n", "<C-z>", "u", opts) -- Normal mode: undo
keymap.set("i", "<C-z>", "<C-o>u", opts) -- Insert mode: undo
keymap.set("v", "<C-z>", "<Esc>u", opts) -- Visual mode: exit and undo

-- ========================================================================================
-- LSP OPERATIONS
-- ========================================================================================

-- Rename symbol with LSP support
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename symbol"})

-- ========================================================================================
-- TABS AND BUFFERS
-- ========================================================================================

-- Tab operations
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Buffer navigation
keymap.set("n", "<M-Left>", "<Cmd>bprevious<CR>", opts)
keymap.set("n", "<M-Right>", "<Cmd>bnext<CR>", opts)

-- ========================================================================================
-- WINDOW MANAGEMENT
-- ========================================================================================

-- Split windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move between windows
keymap.set("n", "s<left>", "<C-w>h", opts)
keymap.set("n", "s<up>", "<C-w>k", opts)
keymap.set("n", "s<down>", "<C-w>j", opts)
keymap.set("n", "s<right>", "<C-w>l", opts)
keymap.set("n", "sw", ":q<CR>", opts)

-- Resize windows
keymap.set("n", "<C-w><left>", "<C-w>>", opts)
keymap.set("n", "<C-w><right>", "<C-w><", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

-- ========================================================================================
-- TELESCOPE (FILE FINDER)
-- ========================================================================================

local builtin = require('telescope.builtin')

-- Main telescope commands
keymap.set("n", "<space>fz", ":Telescope<CR>", opts)
keymap.set("n", "<C-t>", builtin.find_files, opts)
keymap.set("n", "<space>fl", builtin.live_grep, opts)
keymap.set("n", "<space>ff", builtin.buffers, opts)
keymap.set("n", "<space>fo", builtin.oldfiles, opts)
keymap.set("n", "<space>fb", builtin.current_buffer_fuzzy_find, opts)
keymap.set("n", "<space>fh", builtin.help_tags, opts)

-- Quick search
keymap.set("n", "<C-f>", "/", opts)

-- Edit Neovim config
keymap.set("n", "<space>en",
           function() builtin.find_files({cwd = vim.fn.stdpath("config")}) end,
           opts)

-- ========================================================================================
-- GITHUB COPILOT
-- ========================================================================================

keymap.set("n", "<Leader>cc", ":Copilot<CR>", opts)
keymap.set("n", "<Leader>ce", ":Copilot enable<CR>", opts)
keymap.set("n", "<Leader>cd", ":Copilot disable<CR>", opts)

-- ========================================================================================
-- CUSTOM LINE OPERATIONS
-- ========================================================================================

-- Disable automatic comment continuation
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- ========================================================================================
-- NAVIGATION
-- ========================================================================================

-- Jumplist navigation
keymap.set("n", "<C-m>", "<C-i>", opts)

-- ========================================================================================
-- SYSTEM COMMANDS
-- ========================================================================================

-- Save with root permission (requires sudo)
vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
