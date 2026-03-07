return {
 "lambertse/nvim-pomodoro",
 config = function()
    require("nvim-pomodoro").setup({
      focus_time               = 20,
      break_time               = 5,
      long_break_time          = 10,
      cycles_before_long_break = 4,
      keymap                   = "<leader>p",
    })
  end, 
}
