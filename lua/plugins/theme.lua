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
      -- vim.opt.background = "light"
      --
      -- or do
      -- :set background=dark
      -- :set background=light
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    -- priority = 1000,
    -- you can set set configuration options here
    config = function()
      -- vim.g.neobones_compat = 1

      -- vim.g.duckbones = {
      --   lightness = "dim",
      --   darkness = "stark",
      --   solid_vert_split = true,
      --   -- solid_line_nr = true,
      --   solid_float_border = true,
      --   darken_noncurrent_window = true,
      --   lighten_noncurrent_window = true,
      --   darken_comments = 45,
      --   lighten_comments = 45,
      --   darken_non_text = 30,
      --   lighten_non_text = 30,
      --   darken_line_nr = 40,
      --   lighten_line_nr = 40,
      --   darken_cursor_line = 4,
      --   lighten_cursor_line = 3,
      --   colorize_diagnostic_underline_text = true,
      --   transparent_background = true,
      -- }
    end,
  },
}
