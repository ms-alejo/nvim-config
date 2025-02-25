return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"
    notify.setup {
      render = "wrapped-compact",
      stages = "fade_in_slide_out",
      timeout = 1000,
      merge_duplicates = true,
      max_width = 50,
    }
  end,
}
