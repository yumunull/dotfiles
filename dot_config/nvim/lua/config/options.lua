-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.winborder = "rounded"
vim.g.have_nerd_font = true
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "/mnt/c/Users/000/scoop/shims/win32yank.exe -i --crlf",
    ["*"] = "/mnt/c/Users/000/scoop/shims/win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "/mnt/c/Users/000/scoop/shims/win32yank.exe -o --lf",
    ["*"] = "/mnt/c/Users/000/scoop/shims/win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}
