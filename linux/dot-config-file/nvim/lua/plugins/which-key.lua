return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+terminal" },
        ["<leader>r"] = { name = "+wrap mode" },
        --["<leader>m"] = { name = "+markdown" },
        ["<leader>d"] = { name = "+snip run operator" },
        ["<localleader>l"] = { name = "+vimtex" },
      },
    },
  },
}

--return {
--  -- Modify which-key keys
--  {
--    "folke/which-key.nvim",
--    opts = function()
--      require("which-key").register({
--        ["<leader>t"] = { name = "+terminal" },
--        ["<leader>r"] = { name = "+wrap mode" },
--        ["<leader>m"] = { name = "+snip run" },
--        ["<localLeader>m"] = { name = "+vimtex" },
--      })
--    end,
--  },
--}
