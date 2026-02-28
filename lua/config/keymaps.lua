local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ========================================================================================
-- BASIC EDITING
-- ========================================================================================

-- Increment/decrement numbers
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Select all 
keymap.set("n", "<leader>a", "gg<S-v>G", opts)
keymap.set("n", "gg", "gg0", opts)

-- ========================================================================================
-- DELETE OPERATIONS (send to black hole register to preserve clipboard)
-- ========================================================================================

keymap.set("n", "dw", '"_diw', opts)
keymap.set({ "n", "v" }, "d", '"_d', opts)
keymap.set({ "n", "v" }, "D", '"_D', opts)
-- Set jj for switch to normal mode in insert mode
keymap.set("i", "jj", "<Esc>", opts)

-- ========================================================================================
-- CLIPBOARD OPERATIONS
-- ========================================================================================

-- Copy to system clipboard
keymap.set({ "n", "v" }, "cc", '"+y', opts)

-- Paste from system clipboard
keymap.set("n", "cv", '"+P', opts)
keymap.set("v", "cv", '"_dP', opts)

-- Cut to system clipboard
keymap.set("v", "<C-x>", '"+d', opts)
keymap.set("n", "<C-x>", '"+dd', opts)

-- ========================================================================================
-- UNDO/REDO
-- ========================================================================================

keymap.set("n", "<C-z>", "u", opts)
keymap.set("i", "<C-z>", "<C-o>u", opts)
keymap.set("v", "<C-z>", "<Esc>u", opts)

-- ========================================================================================
-- BUFFER OPERATIONS
-- ========================================================================================

-- Buffer navigation
keymap.set("n", "<leader>bb", "<C-o>", opts) -- Go back
keymap.set("n", "<leader>bf", "<C-i>", opts) -- Go forward
keymap.set("n", "<C-s>", ":w<CR>", opts) -- Save buffer
-- Calling conform plugin to format current file
keymap.set("n", "<leader>cF", ":ConformFormat<CR>", opts)


-- ========================================================================================
-- TAB OPERATIONS
-- ========================================================================================

keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- ========================================================================================
-- WINDOW OPERATIONS
-- ========================================================================================

-- Split windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Navigate between windows
keymap.set("n", "s<left>", "<C-w>h", opts)
keymap.set("n", "s<up>", "<C-w>k", opts)
keymap.set("n", "s<down>", "<C-w>j", opts)
keymap.set("n", "s<right>", "<C-w>l", opts)
keymap.set("n", "sw", ":q<CR>", opts)

-- Resize windows
keymap.set("n", "<C-w>h", ":vertical resize +5<CR>", opts)
keymap.set("n", "<C-w>l", ":vertical resize -5<CR>", opts)
keymap.set("n", "<C-w>k", ":resize +2<CR>", opts)
keymap.set("n", "<C-w>j", ":resize -2<CR>", opts)

-- ========================================================================================
-- LSP OPERATIONS
-- ========================================================================================

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- ========================================================================================
-- TELESCOPE (FUZZY FINDER)
-- ========================================================================================

local builtin = require("telescope.builtin")

-- Main telescope commands
keymap.set("n", "<space>fz", ":Telescope<CR>", opts)
keymap.set("n", "<space>ft", builtin.find_files, opts)
keymap.set("n", "<space>fl", builtin.live_grep, opts)
keymap.set("n", "<space>ff", builtin.buffers, opts)
keymap.set("n", "<space>fo", builtin.oldfiles, opts)
keymap.set("n", "<space>fb", builtin.current_buffer_fuzzy_find, opts)
keymap.set("n", "<space>fh", builtin.help_tags, opts)

-- Quick search in current buffer
keymap.set("n", "<C-f>", ":FzfLua blines<CR>", opts)

-- Edit Neovim config
keymap.set("n", "<space>en", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, opts)

-- ========================================================================================
-- COPILOT
-- ========================================================================================

keymap.set("n", "<Leader>cct", ":CopilotChatToggle<CR>", opts)
keymap.set("n", "<Leader>ccr", ":CopilotChatReset<CR>", opts)
keymap.set("n", "<Leader>ccd", ":Copilot disable<CR>", opts)
keymap.set("n", "<Leader>cce", ":Copilot enable<CR>", opts)

-- ========================================================================================
-- FILE EXPLORER
-- ========================================================================================

keymap.set("n", "<Leader>T", ":Neotree toggle<CR>", opts)

-- ========================================================================================
-- CUSTOM LINE OPERATIONS
-- ========================================================================================

-- Insert new line without comment continuation
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- ========================================================================================
-- SYSTEM COMMANDS
-- ========================================================================================

-- Save with root permission (requires sudo)
vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})
