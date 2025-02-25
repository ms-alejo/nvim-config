vim.cmd "set expandtab"
vim.cmd "set tabstop=2"
vim.cmd "set softtabstop=2"
vim.cmd "set shiftwidth=2"
vim.cmd "set cmdheight=0"

require "config.lazy"
require "local-plugins.floating-terminal"
require "local-plugins.todo"
vim.cmd.colorscheme "tokyonight-night"

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo"
vim.opt.termguicolors = true

-- set conceal level to 2 for obsidian.nvim
vim.opt.conceallevel = 2

-- keymaps
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "vv", "v0o$", { noremap = true })
vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })

-- half page movement + centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- move visually select lines up or down
vim.keymap.set("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m <-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m >+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":m-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "J", ":m'>+<CR>gv=gv", { noremap = true, silent = true })

-- window navigation keymaps
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vertical guide line
vim.opt.colorcolumn = "80"
vim.cmd "hi ColorColumn ctermbg=0 guibg=#3c4048"

-- neovim terminal binds
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 10)
end)

-- toggle colorscheme
local colorscheme = { "tokyonight-night", "base16-black-metal-gorgoroth" }
local color_idx = 1
local function toggle_colorscheme()
  color_idx = color_idx % #colorscheme + 1 -- cycle between 1 and 2
  vim.cmd("colorscheme " .. colorscheme[color_idx])
  print("Colorscheme switched to: " .. colorscheme[color_idx])
end
vim.keymap.set("n", "<leader>sc", toggle_colorscheme, { noremap = true, silent = true })

-- AutoCommands
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start terminal in insert mode",
  group = vim.api.nvim_create_augroup("AutoInsertTerminal", { clear = true }),
  callback = function()
    vim.cmd "startinsert"
    vim.cmd "setlocal winfixheight"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable concealing for certain file formats",
  group = vim.api.nvim_create_augroup("DisableConceal", { clear = true }),
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})
