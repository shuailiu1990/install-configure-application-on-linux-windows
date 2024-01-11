return {
  "stevearc/aerial.nvim",
  keys = {
    { "<leader>ca", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
    { "<leader>cn", "<cmd>AerialNext<cr>", desc = "Next Symbol" },
    { "<leader>cp", "<cmd>AerialPrev<cr>", desc = "Previous Symbol" },
  },
  opts = {
    -- add your options that should be passed to the setup() function here
    -- for example:
    -- default_bindings = false,
    -- floating_preview = true,
  },
}
