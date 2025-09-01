return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").setup({
      style = "cool", -- "dark", "darker", "cool", "warm", "warmer"
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

      -- Soft but contrasting colors (modified)
      colors = {
        bg0 = "#1c1f26", -- Main background, a bit darker
        bg1 = "#242831", -- Secondary background, slight contrast
        fg = "#d0d4db", -- Text, slightly brighter
        purple = "#c18fff", -- Purple, softer
        cyan = "#4db5bd", -- Cyan, more pastel
        green = "#a3d39c", -- Green, softer and brighter
        orange = "#e0a869", -- Orange, slightly warmer
        red = "#e2726e", -- Red, slightly less saturated
        yellow = "#e7c777", -- Yellow, softer
      },

      -- Improved highlights (adapted to new colors)
      highlights = {
        CursorLine = { bg = "#29303a" }, -- Cursor line background, slightly darker
        CursorLineNr = { fg = "#e7c777", bold = false }, -- Cursor line number
        LineNr = { fg = "#6a7280" }, -- Line numbers
        Search = { bg = "#e7c777", fg = "#2b2f36" }, -- Search results
        Visual = { bg = "#404757" }, -- Selected text
        MatchParen = { fg = "#c18fff" }, -- Matching parentheses
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
