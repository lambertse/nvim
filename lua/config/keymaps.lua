local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Rename with LSP support
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = 'Rename symbol'})

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- p Save with root permission (not working for now)
vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window

keymap.set("n", "s<left>", "<C-w>h")
keymap.set("n", "s<up>", "<C-w>k")
keymap.set("n", "s<down>", "<C-w>j")
keymap.set("n", "s<right>", "<C-w>l")
keymap.set("n", "sw", ":q<CR>")

-- Copilot keymap
keymap.set("n", "<Leader>cc", ":Copilot<CR>", opts)
keymap.set("n", "<Leader>ce", ":Copilot enable<CR>", opts)
keymap.set("n", "<Leader>cd", ":Copilot disable<CR>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w>>")
keymap.set("n", "<C-w><right>", "<C-w><")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- ----------------------------------------------------------------------------------------
-- Custom continuations

-- Copy to system clipboard
keymap.set("v", "<C-c>", '"+y') -- Copy selected text
keymap.set("n", "<C-c>", '"+yy') -- Copy current line

-- Paste from system clipboard
keymap.set("n", "<C-v>", '"+p') -- Paste in normal mode
keymap.set("v", "<C-v>", '"+p') -- Paste in visual mode
keymap.set("i", "<C-v>", '<C-r>+') -- Paste in insert mode

-- Cut to system clipboard
keymap.set("v", "<C-x>", '"+d') -- Cut selected text
keymap.set("n", "<C-x>", '"+dd') -- Cut current line

-- Redo
keymap.set("i", "<C-z>", "<C-o>u", opts) -- Insert mode: Use <C-o> to temporarily switch to normal mode and undo
keymap.set("v", "<C-z>", "<Esc>u", opts) -- Visual mode: Exit visual mode and undo
keymap.set("n", "<C-z>", "u", opts) -- Normal mode: Just undo

-- Telescope
-- t
local builtin = require('telescope.builtin')

keymap.set("n", "<space>fz", ":Telescope<Esc>", opts)
keymap.set("n", "<space>fh", builtin.help_tags, {})
keymap.set("n", "<C-t>", builtin.find_files, {})
keymap.set("n", "<space>fl", builtin.live_grep, {})
keymap.set("n", "<space>ff", builtin.buffers, {})
keymap.set("n", "<space>fo", builtin.oldfiles, {})
keymap.set("n", "<space>fb", builtin.current_buffer_fuzzy_find, {})
keymap.set("n", "<C-f>", "/", {})

-- Begin: Portal jumplist manager
keymap.set("n", "<M-Left>", "<cmd>Portal jumplist backward<cr>")
keymap.set("n", "<M-Right>", "<cmd>Portal jumplist forward<cr>")
-- End: Portal

keymap.set("n", "<space>en",
           function() builtin.find_files({cwd = vim.fn.stdpath("config")}) end)
