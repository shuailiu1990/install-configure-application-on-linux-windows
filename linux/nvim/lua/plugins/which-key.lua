--return {
--  {
--    "folke/which-key.nvim",
--    opts = {
--      plugins = { spelling = false },
--      defaults = {
--        ["<leader>t"] = { name = "+terminal" },
--      },
--    },
--  },
--}

return {
  -- Modify which-key keys
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        ["<leader>t"] = {
          name = "+terminal",
        },
        ["<leader>r"] = {
          name = "+wrap mode",
        },
      })
    end,
  },
}
