return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "RRethy/base16-nvim",
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    -- priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
    },
  },
  {
    "alexxGmZ/e-ink.nvim",
    -- priority = 1000,
    config = function()
      require("e-ink").setup()
      -- vim.cmd.colorscheme "e-ink"

      -- choose light mode or dark mode
      -- vim.opt.background = "dark"
      vim.opt.background = "light"
      --
      -- or do
      -- :set background=dark
      -- :set background=light
    end,
  },
}
