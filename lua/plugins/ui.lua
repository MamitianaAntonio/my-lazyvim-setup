return {
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    config = function()
      require("scrollview").setup({
        signs_on_startup = { "diagnostics", "search", "git" },
        current_only = true,
        diagnostics_severities = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
        winblend = 20,
        excluded_filetypes = { "NvimTree", "alpha" },
      })
    end,
  },
}
