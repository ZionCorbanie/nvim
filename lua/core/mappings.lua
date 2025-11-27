vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, noremap = true })

--vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set('n', '-', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", vim.cmd("wincmd l"))
-- vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
-- vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
-- vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

vim.keymap.set({"n", "v"}, "j" , "v:count ? 'j' : 'gj'", { expr = true })
vim.keymap.set({"n", "v"}, "k" , "v:count ? 'k' : 'gk'", { expr = true })

local wk = require("which-key")

wk.add({
    -- Use the mode table for mappings that work in both modes
    mode = { "n", "v" },
    {
        -- Window movement mappings (<C-h/j/k/l>)
        { "<C-h>", "<cmd>wincmd h<cr>", desc = "Window Left" },
        { "<C-j>", "<cmd>wincmd j<cr>", desc = "Window Down" },
        { "<C-k>", "<cmd>wincmd k<cr>", desc = "Window Up" },
        { "<C-l>", "<cmd>wincmd l<cr>", desc = "Window Right" },
    },
})

wk.add({
    -- Mappings that use the <leader> prefix
    { "<leader>", group = "Custom Leader Mappings" }, -- Define the root leader group for the whole block

    -- Standalone Mappings
    { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add to Harpoon" },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
    { "<leader>e", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Menu" },
    { "<leader>w", "<C-w>", desc = "Window (Vim default)" }, -- Keep this if you want the standard <C-w> behavior

    -- Neotree Toggle
    { "<leader>-", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },

    -- Group: Copilot (<leader>c)
    { "<leader>c", group = "Copilot" },
    { "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Disable" },
    { "<leader>ce", "<cmd>Copilot enable<cr>", desc = "Enable" },

    -- Group: Telescope/Find (<leader>f)
    { "<leader>f", group = "Telescope" },
    { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },

    -- Group: Packer (<leader>p)
    { "<leader>p", group = "Packer" },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile" },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install" },
    { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync" },
    { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update" },
    { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status" },

    -- Group: Search/Misc (<leader>s)
    { "<leader>s", group = "Search" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },

    -- Group: Trouble (<leader>x)
    { "<leader>x", group = "Trouble" },
    { "<leader>xd", "<cmd>Trouble document_diagnostics toggle<cr>", desc = "Document diagnostics" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Loclist" },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace diagnostics" },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },

    -- Git/LSP References
    { "<leader>gR", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References (Trouble)" },

    -- Which-Key Show Command (for buffer-local maps, if any)
    {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Local Keymaps",
    },
})
