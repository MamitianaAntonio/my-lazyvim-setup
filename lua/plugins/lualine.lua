return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      -- Onedark Darker color palette with highly vibrant mode colors
      local colors = {
        bg = "#1c2526", -- Darker background
        fg = "#abb2bf", -- Light foreground
        yellow = "#e5c07b", -- Onedark yellow
        cyan = "#56b6c2", -- Onedark cyan
        green = "#98c379", -- Onedark green
        red = "#e06c75", -- Onedark red
        purple = "#c678dd", -- Onedark purple
        blue = "#61afef", -- Onedark blue
        gray = "#3e4451", -- Subtle gray for inactive elements
        mode_normal_fg = "#00b7eb", -- Vivid blue for Normal mode
        mode_insert_fg = "#00ff9f", -- Vivid green for Insert mode
        mode_visual_fg = "#ff00ff", -- Vivid magenta for Visual mode
        mode_replace_fg = "#ff4d4d", -- Vivid red for Replace mode
        mode_command_fg = "#ffd700", -- Vivid yellow for Command mode
        mode_normal_bg = "#004a6b", -- Darker vibrant blue
        mode_insert_bg = "#006633", -- Darker vibrant green
        mode_visual_bg = "#660066", -- Darker vibrant magenta
        mode_replace_bg = "#660000", -- Darker vibrant red
        mode_command_bg = "#665500", -- Darker vibrant yellow
      }

      -- Function to get mode-specific icon
      local function mode_icon(mode)
        local icons = {
          normal = "󰅬 ", -- Terminal-like icon
          insert = "󰌌 ", -- Pencil/edit icon
          visual = "󰉧 ", -- Eye/visual icon
          replace = "󰛔 ", -- Replace/overwrite icon
          command = "󰘳 ", -- Command-line icon
        }
        return icons[mode:lower()] or "󰟶 " -- Fallback icon
      end

      local config = {
        options = {
          icons_enabled = true,
          theme = {
            normal = {
              a = { fg = colors.mode_normal_fg, bg = colors.mode_normal_bg, gui = "bold" },
              b = { fg = colors.fg, bg = colors.gray },
              c = { fg = colors.fg, bg = colors.bg },
            },
            insert = { a = { fg = colors.mode_insert_fg, bg = colors.mode_insert_bg, gui = "bold" } },
            visual = { a = { fg = colors.mode_visual_fg, bg = colors.mode_visual_bg, gui = "bold" } },
            replace = { a = { fg = colors.mode_replace_fg, bg = colors.mode_replace_bg, gui = "bold" } },
            command = { a = { fg = colors.mode_command_fg, bg = colors.mode_command_bg, gui = "bold" } },
            inactive = { c = { fg = colors.gray, bg = colors.bg } },
          },
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "▎", right = "▎" }, -- Subtle separators for style
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                local mode = str:lower()
                return mode_icon(mode) .. str:upper() -- Icon + full mode name in uppercase
              end,
              color = function()
                local mode = vim.fn.mode():lower()
                local colors_map = {
                  normal = { fg = colors.mode_normal_fg, bg = colors.mode_normal_bg, gui = "bold" },
                  insert = { fg = colors.mode_insert_fg, bg = colors.mode_insert_bg, gui = "bold" },
                  visual = { fg = colors.mode_visual_fg, bg = colors.mode_visual_bg, gui = "bold" },
                  replace = { fg = colors.mode_replace_fg, bg = colors.mode_replace_bg, gui = "bold" },
                  command = { fg = colors.mode_command_fg, bg = colors.mode_command_bg, gui = "bold" },
                }
                return colors_map[mode] or { fg = colors.fg, bg = colors.bg }
              end,
            },
          },
          lualine_b = {
            { "branch", icon = "", color = { fg = colors.yellow } },
            {
              "diff",
              symbols = { added = " ", modified = "󰏬 ", removed = "󰅖 " },
              color = { fg = colors.cyan },
            },
          },
          lualine_c = {
            { "filename", path = 1, symbols = { modified = "●", readonly = "" }, color = { fg = colors.fg } },
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
              color = { fg = colors.red },
            },
          },
          lualine_x = {
            { "filetype", icon_only = true, color = { fg = colors.blue } },
            { "encoding", color = { fg = colors.gray } },
            { "fileformat", color = { fg = colors.gray } },
          },
          lualine_y = {
            { "progress", color = { fg = colors.green } },
          },
          lualine_z = {
            { "location", icon = "󰆤", color = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", color = { fg = colors.gray } } },
          lualine_x = { { "location", color = { fg = colors.gray } } },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
      }

      return config
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
