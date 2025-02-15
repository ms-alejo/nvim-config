return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      idle = {
        enabled = true,
      },
      display = {
        theme = "pastel",
      },
    },
  },
}
