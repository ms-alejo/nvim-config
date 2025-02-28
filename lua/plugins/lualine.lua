return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      -- options = {
      --   theme = "dracula",
      -- },
      sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_z = { { "datetime", style = "%D | %H:%M:%S" } },
      },
    }
  end,
}
