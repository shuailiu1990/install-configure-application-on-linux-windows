return {
  {
    "andrewferrier/wrapping.nvim",
    keys = {
      { "<leader>rs", "<cmd>SoftWrapMode<CR>", desc = "Soft Wrap Mode" },
      { "<leader>rh", "<cmd>HardWrapMode<CR>", desc = "Hard Wrap Mode" },
    },
    opts = {
      create_commands = false,
      create_keymaps = false,
      set_nvim_opt_defaults = false,
    },
    config = function()
      require("wrapping").setup()
    end,
  },
}
