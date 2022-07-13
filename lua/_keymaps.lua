-- Key Mappings

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- General
keymap("n", "<C-u>", '<C-r>', opts) -- redo
keymap("i", "jk", '<ESC>', opts) -- exit insert mode
keymap("n", "<Enter>", 'o<ESC>', opts) -- standard enter
keymap("n", "<BS>", 'i<BS><ESC>', opts) -- standard backspace

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("v", "<C-a>", "gg<S-v>G", opts)

-- Paste from register
keymap("n", "p", '"0p', opts)
keymap("n", "P", '"0P', opts)
--keymap("n", "<Leader>d", '"_d', opts)
-- File management
-- Save file
keymap("n", "<C-s>", ':update<cr>', opts)
keymap("i", "<C-s>", '<Esc>:update<cr>gi', opts)
keymap("v", "<C-s>", ':<Esc>:update<cr>gv', opts)
-- Quit file
keymap("n", "<C-q>", ':q<cr>', opts)
keymap("v", "<C-q>", '<Esc>:q<cr>', opts)
keymap("i", "<C-q>", '<Esc>:q<cr>', opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Splits
keymap("n", "<C-p>", ":wincmd h <bar> :Vex<cr>", opts) -- open file tree
keymap("n", "<C-\\>", "<C-w>v", opts) -- split screen
-- doesnt work ??
-- keymap("n", "<C-0>", "<C-w>o", opts) -- close split


-- Navigate buffers
keymap("n", "<C-o>", "<C-^>", opts) -- back/forth buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) - Move and enter edit mode
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

--- Visual Block ---
-- Move text up and down
keymap("n", "<Leader>q", "<C-q>", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--
-- Telescope
--
-- Builtin
keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', opts)
keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', opts)
keymap('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap('n', '<leader>fd', '<CMD>lua require("telescope.builtin").live_grep({grep_open_file = true})<CR>', opts)
keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap('n', '<leader>fe', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', opts)
keymap('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', opts)

-- Language Servers
-- -- Do not work for now
-- keymap('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', opts)
-- keymap('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', opts)
-- keymap('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', opts)
-- keymap('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>',opts)

-- Toogle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
    vim.diagnostic.show()
  else
    vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
    vim.diagnostic.hide()
  end
end

vim.keymap.set('n', '<leader>e', toggle_diagnostics)