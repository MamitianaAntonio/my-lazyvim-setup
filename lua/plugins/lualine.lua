return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local colors = {
        -- Main palette
        bg = "#1d1d2c", -- Main background, slightly darker
        fg = "#cdd6f4", -- Text, light and readable
        gray = "#303346", -- Gray, for secondary elements
        red = "#f2879b", -- Red, softer
        green = "#a8e3a3", -- Green, soft and bright
        yellow = "#f9dea0", -- Yellow, gentle
        blue = "#8cb6fa", -- Blue, lighter and pastel
        purple = "#cfa7f7", -- Purple, softer
        cyan = "#95e3d6", -- Cyan, light
        orange = "#fbb88a", -- Orange, warmer
        -- Mode highlighs (for statusline or Lualine)
        mode_normal = { fg = "#1d1d2c", bg = "#8cb6fa" }, -- Normal mode
        mode_insert = { fg = "#1d1d2c", bg = "#a8e3a3" }, -- Insert mode
        mode_visual = { fg = "#1d1d2c", bg = "#cfa7f7" }, -- Visual mode
        mode_replace = { fg = "#1d1d2c", bg = "#f2879b" }, -- Replace mode
        mode_command = { fg = "#1d1d2c", bg = "#fbb88a" }, -- Command mode
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
      vim.api.nvim_set_hl(0, "animatedglitch", { fg = colors.cyan, bg = colors.gray, bold = true })
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
