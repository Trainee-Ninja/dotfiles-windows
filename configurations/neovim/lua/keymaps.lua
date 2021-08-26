-- All Neovim keymappings are defined here in this file

local api = vim.api

-- Wrapper for easier & less verbose way of mapping keys
-- TODO: Refactor function to handle global keymaps as well.
--! NOTE: The "map" function right now only maps keys for the
--! first buffer which is why mappings for navigating around
--! windows doesn't work as aspected
local map = function(mode, key, value)
    api.nvim_buf_set_keymap(0, mode, key, value, { noremap = true, silent = true })
end

-- Utility for escaping termcodes & keycodes like "<C-n>"
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- Use Shift+Tab to move up-down in the completion menu
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["coc#refresh"]()
  end
end

-- Disabling the following keys helps to learn the Vim motions better & more efficiently
-- Disable Arrow keys
map("", "<UP>", "<NOP>")
map("", "<DOWN>", "<NOP>")
map("", "<LEFT>", "<NOP>")
map("", "<RIGHT>", "<NOP>")

-- Disables Arrow keys in Insert Mode as well
map("i", "<UP>", "<NOP>")
map("i", "<DOWN>", "<NOP>")
map("i", "<LEFT>", "<NOP>")
map("i", "<RIGHT>", "<NOP>")

api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })          -- Remap "jk" to <ESC> to quite out of Insert mode

-- Telescope mappings
map("n", "<Leader>ff", ":Telescope find_files<CR>")                                  -- Opens a File Explorer within Telescope
map("n", "<Leader>fb", ":Telescope buffers<CR>")                                     -- Telescope shows a list of available buffers
map("n", "<Leader>fe", ":Telescope file_browser<CR>")                                -- Telescope shows a list of available files & directories in the current working directory

-- NOTE: It's best to disable the "<ESC>" at the end else you
-- would've no way to change modes after a Insert mode session.
-- Disable <ESC> when in Insert mode
map("i", "<ESC>", "<NOP>")

-- Tab completion for coc.nvim
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
