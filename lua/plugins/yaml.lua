return {
  -- YAML support with syntax highlighting
  {
    "stephpy/vim-yaml",
    ft = "yaml",
    config = function()
      vim.g.yaml_fold_level = 1 -- optional: fold blocks
    end,
  },

  -- OpenAPI / Swagger support with LSP-style validation
  {
    "redhat-developer/yaml-language-server",
    ft = "yaml",
    run = "npm i -g yaml-language-server",
  },

  -- Optional: Better LSP & autocompletion
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").yamlls.setup({
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "api.yml",
            },
            validate = true,
          },
        },
      })
    end,
  },
}
