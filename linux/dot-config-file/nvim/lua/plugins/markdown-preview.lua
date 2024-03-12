return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  keys = {
    --{ "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "MarkdownPreview" },
    { "<leader>cs", "<cmd>MarkdownPreviewStop<CR>", desc = "Markdown Preview Stop" },
    --{ "<leader>mP", "<cmd>MarkdownPreviewToggle<CR>", desc = "MarkdownPreviewToggle" },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
