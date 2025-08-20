return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").setup({
      style = "darker", -- "dark", "darker", "cool", "warm", "warmer"
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      -- Désactivation des styles forcés
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Couleurs douces mais contrastées
      colors = {
        bg0 = "#1e222a", -- Fond principal
        bg1 = "#262a33", -- Fond secondaire
        fg = "#c8ccd4", -- Texte
        purple = "#b88fe9",
        cyan = "#56b6c2",
        green = "#9ece6a",
        orange = "#d19a66",
        red = "#e06c75",
        yellow = "#e5c07b",
      },

      -- Amélioration des highlights
      highlights = {
        CursorLine = { bg = "#2a2f3a" },
        CursorLineNr = { fg = "#e5c07b", bold = false },
        LineNr = { fg = "#5c6370" },
        Search = { bg = "#e5c07b", fg = "#282c34" },
        Visual = { bg = "#3e4451" },
        MatchParen = { fg = "#b88fe9" },
      },

      plugins = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        nvimtree = true,
        lualine = true,
        bufferline = true,
      },

      integrations = {
        treesitter = true,
        telescope = true,
        notify = true,
        cmp = true,
        gitsigns = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },

      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    })

    require("onedark").load()
  end,
}
