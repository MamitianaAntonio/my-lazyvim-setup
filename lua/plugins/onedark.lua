return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false, -- Ne pas attendre pour charger le thème
  config = function()
    require("onedark").setup({
      style = "darker", -- Tu peux changer par : "dark", "darker", "cool", "warm", "warmer"
      transparent = false, -- si tu veux un fond transparent
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      -- Intégrations automatiques avec Lualine et autres
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "italic",
        strings = "none",
        variables = "none",
      },

      plugins = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        nvimtree = true,
        lualine = true,
      },
    })

    require("onedark").load()
  end,
}
