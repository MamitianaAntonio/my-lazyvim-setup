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
      }

      local function mode_icon(mode)
        local icons = {
          n = " ",
          i = " ",
          v = " ",
          V = " ",
          R = " ",
          c = " ",
        }
        return icons[mode] or " "
      end

      -- Frames animation : points plus petits, serrés
      local frames = {
        "····",
        "····",
        "····",
        "····",
      }
      local current_frame = 1

      local function animated_dots()
        local dots = frames[current_frame]
        current_frame = (current_frame % #frames) + 1
        return "%#AnimatedDots#" .. dots .. "%*"
      end

      vim.api.nvim_set_hl(0, "AnimatedDots", { fg = colors.purple, bg = colors.gray })

      -- Timer moins fréquent (400ms)
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
                return mode_icon(vim.fn.mode()) .. str:sub(1, 1)
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
              padding = { left = 2, right = 2 },
            },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
              color = { fg = colors.yellow, bg = colors.gray, gui = "bold" },
              padding = { left = 2, right = 2 },
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              color = { fg = colors.cyan, bg = colors.gray },
              padding = { left = 2, right = 2 },
            },
          },
          lualine_c = {
            { "filename", path = 1, color = { fg = colors.fg, bg = colors.gray }, padding = { left = 1, right = 1 } },
            { animated_dots, padding = { left = 1, right = 1 } },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " " },
              color = { fg = colors.red, bg = colors.gray },
              padding = { left = 2, right = 2 },
            },
            {
              "filetype",
              icon_only = true,
              color = { fg = colors.blue, bg = colors.gray },
              padding = { left = 2, right = 2 },
            },
          },
          lualine_y = {
            { "progress", color = { fg = colors.green, bg = colors.gray }, padding = { left = 2, right = 2 } },
          },
          lualine_z = {
            {
              "location",
              icon = "",
              color = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
              padding = { left = 2, right = 2 },
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", color = { fg = colors.gray, bg = colors.bg } } },
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
