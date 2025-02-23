return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      idle = {
        enabled = false,
      },
      display = {
        theme = "pastel",
        show_repository = false,
      },
    },
  },
}
