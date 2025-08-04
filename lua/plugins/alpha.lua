-- ~/.config/nvim/lua/plugins/alpha.lua

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII Art NEOVIM
    dashboard.section.header.val = {
      [[⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⢀⣴⣿⡿⠿⠿⠿⠿⢿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠉⠙⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⣼⣿⣿⠀⠀⢀⣤⣶⣶⣶⣦⣄⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⣿⣿⡇⠀⠀⣿⣿⠿⠿⠿⣿⣿⣾⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⣿⣿⣇⠀⠀⠹⣷⣶⣶⣶⣶⣾⣿⡿⢿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠸⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠙⣿⣷⡀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠈⠛⢿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣷⣶⣤⣤⣤⣴⣶⣾⣿⡿⠋⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠋⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠶⠶⢦⣄⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠃⠀⠀⠀⠀⠀⠀⠀⠻⠇⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  N E O V I M⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  Nouveau fichier", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰱼  Rechercher un fichier", ":Telescope find_files<CR>"),
      dashboard.button("o", "  Fichiers récents", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Grep dans les fichiers", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Config Neovim", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "󰿅  Quitter Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = function()
      return "⚡ LazyVim + Telescope + Alpha par Antonio"
    end

    dashboard.opts.opts.noautocmd = true
    return dashboard
  end,
}
