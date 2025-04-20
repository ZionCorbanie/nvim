vim.g.mapleader = " "
--vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set('n', '-', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", vim.cmd("wincmd l"))
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

vim.keymap.set({"n", "v"}, "j" , "v:count ? 'j' : 'gj'", { expr = true })
vim.keymap.set({"n", "v"}, "k" , "v:count ? 'k' : 'gk'", { expr = true })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--local keymap = vim.keymap -- for conciseness
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  -- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
    { "<leader>a", desc = "Add to harpoon", nowait = true, remap = false },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot", nowait = true, remap = false },
    { "<leader>ce", "<cmd>Copilot enable<cr>", desc = "Enable Copilot", nowait = true, remap = false },
    { "<leader>e", desc = "Harpoon search", nowait = true, remap = false },
    { "<leader>f", group = "Telescope", nowait = true, remap = false },
    { "<leader>fb", desc = "buffers", nowait = true, remap = false },
    { "<leader>ff", desc = "Find files", nowait = true, remap = false },
    { "<leader>fg", desc = "Live grep", nowait = true, remap = false },
    { "<leader>fh", desc = "Help tags", nowait = true, remap = false },
    { "<leader>gR", "<cmd>Trouble lsp_references toggle<cr>", desc = "", nowait = true, remap = false },
    { "<leader>p", group = "Packer", nowait = true, remap = false },
    { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>w", "<C-w>", desc = "Window", nowait = true, remap = false },
    { "<leader>x", group = "Trouble", nowait = true, remap = false },
    { "<leader>xd", "<cmd>Trouble document_diagnostics toggle<cr>", desc = "document_diagnostics", nowait = true, remap = false },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "loclist", nowait = true, remap = false },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "quickfix", nowait = true, remap = false },
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "workspace_diagnostics", nowait = true, remap = false },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "toggle trouble", nowait = true, remap = false },
}

which_key.setup(setup)
which_key.register(mappings, opts)
