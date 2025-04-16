-- enable line number and relative line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- width of a tab
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

--vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- set clipboard
vim.opt.clipboard ="unnamedplus"

vim.filetype.add({
  extension = {
      templ = "templ",
  },
})

-- vim.cmd([[
-- augroup TransparentBackground
-- autocmd!
-- autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
-- autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
-- augroup END
-- ]])
