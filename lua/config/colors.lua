-- Fonction pour foncer le texte normal
vim.api.nvim_set_hl(0, "Normal", { fg = "#7c7c7c", bg = "NONE" }) -- gris foncé
-- Tu peux aussi foncer les commentaires
vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })
-- Si tu veux, foncer aussi le texte dans l'explorateur, terminal, etc.
vim.api.nvim_set_hl(0, "Directory", { fg = "#6c6c6c" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7f8c8d", bold = true })
