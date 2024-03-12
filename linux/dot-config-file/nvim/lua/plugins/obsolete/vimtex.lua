return {
  "lervag/vimtex",
  lazy = false,
  --keys = {
  --  { "<leader>lv", "<cmd>VimtexView<CR>", desc = "<Plug>(vimtex-view)" },
  --  { "<leader>ll", "<cmd>VimtexCompile<CR>", desc = "<Plug>(vimtex-compile)" },
  --},
  init = function()
    -- Use init for configuration, don't use the more common "config".

    -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
    -- Automatically complete braces when typing LaTeX
    --vim.g.vimtex_complete_close_braces = 1

    -- Set the compiler method for Vimtex to latexmk
    vim.g.vimtex_compiler_method = "latexmk"

    -- there are warning messages and no error messages.
    -- Control whether or not to automatically open the |quickfix| window in case
    --vim.g.vimtex_quickfix_open_on_warning = 0

    -- Choose which program to use to view PDF file
    vim.g.vimtex_view_method = "zathura"

    -- Value 1 allows forward search after every successful compilation
    --vim.g.vimtex_view_zathura_sync = 1

    -- Value 1 allows change focus to pdf viewer after command `:VimtexView` is given
    --vim.g.vimtex_view_zathura_activate = 1
    --vim.g.vimtex_view_automatic = 1
    vim.keymap.set("n", "<localLeader>", '<cmd>lua require("which-key").show("\\\\")<cr>')
    --vim.keymap.set("n", "<localLeader>", "<Space>")
  end,
}
