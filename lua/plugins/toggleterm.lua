return {
  "lambertse/nvim-toggleterm",
  config = function()
    require("nvim-toggleterm").setup({
      create_keymap = true, -- set to true to create <leader>tt
      keymap = "tr", -- toggle key
    })
  end,
}
