-- hlslens configuration for search integration
return {
    "kevinhwang91/nvim-hlslens",
    config = function()
        require("hlslens").setup({
            build_position_cb = function(plist, _, _, _)
                require("scrollbar.handlers.search").handler.show(
                    plist.start_pos)
            end
        })

        -- Clear search highlights and scrollbar when search is done
        vim.cmd([[
      augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
      augroup END
    ]])

        -- Key mappings for enhanced search experience
        local opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap('n', 'n',
                                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', 'N',
                                [[<Cmd>execute('normal! ' . v:count2 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', '*',
                                [[*<Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', '#',
                                [[#<Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', 'g*',
                                [[g*<Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', 'g#',
                                [[g#<Cmd>lua require('hlslens').start()<CR>]],
                                opts)
        vim.api.nvim_set_keymap('n', '<Esc>', '<Cmd>noh<CR>', opts)
    end
}
