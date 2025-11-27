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
    -- Harpoon/Buffers/Copilot/Window (Flat Mappings)
    ["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add to Harpoon" },
    ["b"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
    ["e"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Menu" }, -- Changed from 'Harpoon search' to menu, as 'e' is typically the toggle menu
    ["w"] = { "<C-w>", desc = "Window" },

    -- Copilot Group: <leader>c
    ["c"] = {
        name = "Copilot",
        ["d"] = { "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
        ["e"] = { "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
    },

    -- Telescope (Search) Group: <leader>f
    ["f"] = {
        name = "Telescope",
        ["b"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffers" }, -- Changed action to prevent duplication with <leader>b
        ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
        ["g"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
        ["h"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },
    },

    -- Packer Group: <leader>p
    ["p"] = {
        name = "Packer",
        ["c"] = { "<cmd>PackerCompile<cr>", desc = "Compile" },
        ["i"] = { "<cmd>PackerInstall<cr>", desc = "Install" },
        ["s"] = { "<cmd>PackerSync<cr>", desc = "Sync" },
        ["u"] = { "<cmd>PackerUpdate<cr>", desc = "Update" },
        ["S"] = { "<cmd>PackerStatus<cr>", desc = "Status" },
    },

    -- Secondary Search Group: <leader>s (Consolidated for clarity)
    ["s"] = {
        name = "Search",
        ["C"] = { "<cmd>Telescope commands<cr>", desc = "Commands" },
        ["M"] = { "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        ["R"] = { "<cmd>Telescope registers<cr>", desc = "Registers" },
        ["b"] = { "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        ["c"] = { "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
        ["h"] = { "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
        ["k"] = { "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        ["r"] = { "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    },

    -- Trouble Group: <leader>x
    ["x"] = {
        name = "Trouble",
        ["d"] = { "<cmd>Trouble document_diagnostics toggle<cr>", desc = "Document diagnostics" },
        ["l"] = { "<cmd>Trouble loclist toggle<cr>", desc = "Loclist" },
        ["q"] = { "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
        ["w"] = { "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace diagnostics" },
        ["x"] = { "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" }, -- This is now safe
    },

    -- Git/LSP References (Standalone)
    ["g"] = {
        name = "Git/LSP",
        ["R"] = { "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References (Trouble)" },
    },
}

-- The registration call now uses the simpler format for the nested table
which_key.register(mappings, opts)

which_key.setup(setup)
which_key.register(mappings, opts)
