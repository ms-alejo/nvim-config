local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.6)
  local height = opts.height or math.floor(vim.o.lines * 0.6)

  -- calc the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- create or reuse a buffer
  local buf = state.floating.buf
  if not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
    state.floating.buf = buf
  end

  -- define window configuration
  local window_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    border = "rounded",
    title = "TODO LIST",
    title_pos = "center",
  }

  -- create the floating window
  local win = vim.api.nvim_open_win(buf, true, window_config)
  state.floating.win = win

  -- set buffer options
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].modifiable = true

  return { buf = buf, win = win }
end

local function toggle_markdown_buffer()
  local file_path = "D:/Obsidian/Life Vault 2025/TODO.md"

  if not vim.api.nvim_win_is_valid(state.floating.win) then
    -- create the floating window
    state.floating = create_floating_window()

    --load the file into the buffer
    if vim.api.nvim_buf_get_name(state.floating.buf) ~= file_path then
      vim.cmd("edit " .. vim.fn.fnameescape(file_path))
    end
  else
    -- close floating window
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- keymaps
vim.api.nvim_create_user_command("FloatMarkdown", toggle_markdown_buffer, {})
vim.keymap.set("n", "<leader>td", toggle_markdown_buffer, { desc = "Markdown [T]o[D]o List" })
