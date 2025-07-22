return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    require("cmake-tools").setup {
      cmake_command = "cmake",
      cmake_build_options = {}
    }
  end,
}
