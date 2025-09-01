-- Darken the main text color (Normal text)
vim.api.nvim_set_hl(0, "Normal", { fg = "#7c7c7c", bg = "NONE" }) -- dark grey

-- Darken comments for better readability
vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })

-- Darken directory names (used in file explorers like Neo-tree or netrw)
vim.api.nvim_set_hl(0, "Directory", { fg = "#6c6c6c" })

-- Highlight the line number of the current line
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7f8c8d", bold = true })

-- Optional: Slightly darken line numbers of other lines
vim.api.nvim_set_hl(0, "LineNr", { fg = "#606060" })

-- Optional: Darken visual selection for better contrast
vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3a3a", fg = "NONE" })
