return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local colors = {
        bg = "#1e1e2e",
        fg = "#cdd6f4",
        gray = "#313244",
        red = "#f38ba8",
        green = "#a6e3a1",
        yellow = "#f9e2af",
        blue = "#89b4fa",
        purple = "#cba6f7",
        cyan = "#94e2d5",
        orange = "#fab387",

        mode_normal = { fg = "#1e1e2e", bg = "#89b4fa" },
        mode_insert = { fg = "#1e1e2e", bg = "#a6e3a1" },
        mode_visual = { fg = "#1e1e2e", bg = "#cba6f7" },
        mode_replace = { fg = "#1e1e2e", bg = "#f38ba8" },
        mode_command = { fg = "#1e1e2e", bg = "#fab387" },
      }

      -- Animations
      local animated_frames = { "  ", "  ", "  " }
      local current_frame = 1
      local function animated_dots()
        local frame = animated_frames[current_frame]
        current_frame = (current_frame % #animated_frames) + 1
        return "%#animateddots#" .. frame .. "%*"
      end
      vim.api.nvim_set_hl(0, "animateddots", { fg = colors.purple, bg = colors.bg })
      local timer = vim.loop.new_timer()
      timer:start(
        0,
        300,
        vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end)
      )

      -- Glitch
      local glitch_frames = { "010101", "101010", "110011", "001100", "111000", "000111" }
      local glitch_index = 1
      local function animated_glitch()
        local frame = glitch_frames[glitch_index]
        glitch_index = (glitch_index % #glitch_frames) + 1
        return "%#animatedglitch#" .. frame .. "%*"
      end
      vim.api.nvim_set_hl(0, "animatedglitch", { fg = colors.cyan, bg = colors.bg, bold = true })
      local glitch_timer = vim.loop.new_timer()
      glitch_timer:start(
        0,
        120,
        vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end)
      )

      return {
        options = {
          icons_enabled = true,
          theme = nil,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = { "NvimTree", "packer" },
        },

        sections = {
          -- Mode amélioré
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                local icons = {
                  n = " Normal",
                  i = " Insert",
                  v = " Visual",
                  V = " V-Line",
                  ["␖"] = " V-Block",
                  c = " Command",
                  R = " Replace",
                }
                return icons[vim.fn.mode()] or str
              end,
              color = function()
                local m = vim.fn.mode()
                local map = {
                  n = colors.mode_normal,
                  i = colors.mode_insert,
                  v = colors.mode_visual,
                  V = colors.mode_visual,
                  ["␖"] = colors.mode_visual,
                  R = colors.mode_replace,
                  c = colors.mode_command,
                }
                return map[m] or { fg = colors.fg, bg = colors.bg }
              end,
              padding = { left = 2, right = 1 },
            },
          },

          lualine_b = {
            { "branch", icon = "", color = { fg = colors.blue, bg = colors.gray, gui = "bold" } },
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          },

          lualine_c = {
            { "filename", path = 1 },
            { animated_dots },
            { animated_glitch },
          },

          lualine_x = {
            {
              function()
                return vim.fn.reg_recording() ~= "" and " " .. vim.fn.reg_recording() or ""
              end,
              color = { fg = colors.orange, gui = "bold" },
            },
            {
              function()
                local clients = vim.lsp.get_active_clients()
                if #clients > 0 then
                  return " LSP:" .. clients[1].name
                end
                return ""
              end,
              color = { fg = colors.cyan },
            },
            { "diagnostics", symbols = { error = " ", warn = " ", info = " " } },
          },

          lualine_y = {
            {
              "progress",
              fmt = function()
                return " %p%%"
              end,
            },
            { "encoding", icon = "" },
          },

          lualine_z = {
            { "location", icon = "" },
            {
              function()
                return " " .. os.date("%H:%M")
              end,
              color = { fg = colors.green, gui = "bold" },
            },
          },
        },

        inactive_sections = {
          lualine_c = { { "filename", color = { fg = colors.gray } } },
          lualine_x = { { "location" } },
        },

        extensions = { "neo-tree", "lazy", "mason" },
      }
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
