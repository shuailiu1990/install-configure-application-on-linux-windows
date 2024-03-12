return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  -- do 'sh install.sh 1' if you want to force compile locally
  -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
  keys = {
    { "d", "<Plug>SnipRun", desc = "SnipRun", silent = true, mode = "v" },
    { "<leader>dd", "<Plug>SnipRun", desc = "SnipRun", silent = true, mode = "n" },
    { "<leader>dc", "<Plug>SnipClose", desc = "SnipClose", silent = true, mode = "n" },
    { "<leader>dC", "<Plug>SnipReplMemoryClean", desc = "SnipReplMemoryClean", silent = true, mode = "n" },
    { "<leader>dl", "<Plug>SnipLive", desc = "SnipLive", silent = true, mode = "n" },
  },
  config = function()
    require("sniprun").setup({
      -- your options
      display = { "TempFloatingWindow" },
      --display_options = {
      --  terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
      --  terminal_line_number = false, -- whether show line number in terminal window
      --  terminal_signcolumn = false, -- whether show signcolumn in terminal window
      --  terminal_position = "horizontal", --# or "horizontal", to open as horizontal split instead of vertical split
      --  terminal_width = 45, --# change the terminal display option width (if vertical)
      --  terminal_height = 8, --# change the terminal display option height (if horizontal)
      --},
    })
  end,
}
