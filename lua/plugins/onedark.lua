return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker", -- "dark", "darker", "cool", "warm", "warmer"
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      -- Pas de style forcé
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Palette sombre et élégante
      colors = {
        bg0 = "#1b1f27", -- Fond principal
        bg1 = "#222630", -- Fond secondaire
        fg = "#c8ccd4", -- Texte
        purple = "#bb9af7",
        cyan = "#7dcfff",
        green = "#9ece6a",
        orange = "#ff9e64",
        red = "#f7768e",
        yellow = "#e0af68",
      },

      -- Highlights personnalisés
      highlights = {
        CursorLine = { bg = "#2a2f3a" },
        CursorLineNr = { fg = "#e0af68", bold = false },
        LineNr = { fg = "#5c6370" },
        Search = { bg = "#e0af68", fg = "#1b1f27" },
        Visual = { bg = "#3e4451" },
        MatchParen = { fg = "#bb9af7", bold = true },

        -- Ligne verticale (colorcolumn)
        ColorColumn = { bg = "#3e445180" },

        -- Indent guides
        IndentBlanklineChar = { fg = "#4b526380" },
        IndentBlanklineContextChar = { fg = "#bb9af780" },
      },

      -- Plugins intégrés
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
