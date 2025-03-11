return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    enabled = false,
    opts = {
      idle = {
        enabled = false,
      },
      display = {
        theme = "catpuccin",
        show_repository = false,
      },
      text = {
        workspace = "",
      },
    },
  },
}
