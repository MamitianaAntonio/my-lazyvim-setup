return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local colors = {
        bg = "#282c34",
        fg = "#abb2bf",
        gray = "#3e4451",
        red = "#e06c75",
        green = "#98c379",
        yellow = "#e5c07b",
        blue = "#61afef",
        purple = "#c678dd",
        cyan = "#56b6c2",

        mode_normal = { fg = "#282c34", bg = "#61afef" },
        mode_insert = { fg = "#282c34", bg = "#98c379" },
        mode_visual = { fg = "#282c34", bg = "#c678dd" },
        mode_replace = { fg = "#282c34", bg = "#e06c75" },
        mode_command = { fg = "#282c34", bg = "#e5c07b" },

        dark_purple = "#4b366e",
        light_cyan = "#7fdbca",
      }

      -- Animation 3 icônes côte à côte (frames)
      local animated_frames = {
        "  ●   ",
        " ●    ●",
        "●    ● ",
        "   ●  ",
        "  ●   ●",
        " ●   ● ",
      }

      local current_frame = 1

      local function animated_six_icons()
        local frame = animated_frames[current_frame]
        current_frame = (current_frame % #animated_frames) + 1
        return "%#AnimatedDots#" .. frame .. "%*"
      end

      vim.api.nvim_set_hl(0, "AnimatedDots", { fg = colors.purple, bg = colors.gray })

      -- Timer pour rafraîchir lualine toutes les 400ms
      local timer = vim.loop.new_timer()
      timer:start(
        0,
        400,
        vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end)
      )

      return {
        options = {
          icons_enabled = true,
          theme = nil,
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                local icons = {
                  n = "",
                  i = "",
                  v = "",
                  V = "",
                  R = "",
                  c = "",
                }
                local icon = icons[vim.fn.mode()] or ""
                return icon .. " " .. str:sub(1, 1):upper()
              end,
              color = function()
                local m = vim.fn.mode()
                local map = {
                  n = colors.mode_normal,
                  i = colors.mode_insert,
                  v = colors.mode_visual,
                  V = colors.mode_visual,
                  R = colors.mode_replace,
                  c = colors.mode_command,
                }
                return map[m] or { fg = colors.fg, bg = colors.bg }
              end,
              padding = { left = 2, right = 1 },
            },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
              color = { fg = colors.yellow, bg = colors.gray, gui = "bold" },
              padding = { left = 1, right = 1 },
            },
            {
              "diff",
              symbols = { added = "", modified = "", removed = "" },
              color = { fg = colors.cyan, bg = colors.gray },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_c = {
            { "filename", path = 1, color = { fg = colors.fg, bg = colors.gray }, padding = { left = 1, right = 1 } },
            { animated_six_icons, padding = { left = 0, right = 1 } },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = "", warn = "", info = "" },
              color = { fg = colors.purple, bg = colors.dark_purple, gui = "bold" },
              padding = { left = 1, right = 1 },
            },
            {
              "filetype",
              icon_only = false,
              color = { fg = colors.blue, bg = colors.gray, gui = "italic" },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_y = {
            {
              "progress",
              fmt = function()
                return " %p%%"
              end,
              color = { fg = colors.green, bg = colors.gray, gui = "bold" },
              padding = { left = 1, right = 2 },
            },
          },
          lualine_z = {
            {
              "location",
              icon = "",
              color = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
              padding = { left = 1, right = 2 },
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename", color = { fg = colors.gray, bg = colors.bg }, padding = { left = 1, right = 1 } },
          },
          lualine_x = { { "location", color = { fg = colors.gray, bg = colors.bg } } },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
