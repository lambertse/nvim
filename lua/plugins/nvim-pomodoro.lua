local local_dir = "/Users/tri.le/src/opensource/lambertse/nvim-plugins/pomodoro"

local plugin_source
if vim.loop.fs_stat(local_dir) then
  plugin_source = { dir = local_dir }
else
  plugin_source = { "lambertse/nvim-pomodoro" }
end

return vim.tbl_extend("force", plugin_source, {
  config = function()
    require("nvim-pomodoro").setup({
      focus_time = 50,
      break_time = 15,
      long_break_time = 20,
      cycles_before_long_break = 4,
      keymap = "<leader>p",
      sound = {
        enabled = true,
        volume = 0.7,
        backend = "auto",
        events = {
          start = true,
          done = true,
          milestone = true,
          tick = false,
        },
      },
    })
  end,
})
