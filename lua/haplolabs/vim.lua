local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    backup = false,
    ruler = true,
    errorbells = false,
    expandtab = true,
    smarttab = true,
    smartindent = true,
    autoindent = true,
    laststatus = 0,
    conceallevel = 0,
    hidden = true,
    scrolloff = 3,
    softtabstop = 2,
    showmode = false,
    termguicolors = true,
    background = 'dark',
    cursorline = true,
    pumheight = 10,
    cmdheight = 2,
    showtabline = 2,
    hlsearch = false,
    mouse = 'a'
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.clipboard = 'unnamedplus'
  vim.o.shortmess = vim.o.shortmess .. 'c'
  vim.opt.formatoptions = vim.opt.formatoptions
    + {
        c = false,
        o = false,
        r = true,
      }

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set fileencoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set tabstop=2')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set splitbelow')
  vim.cmd('set updatetime=300')
  vim.cmd('set timeoutlen=500')
  vim.cmd('set t_Co=256')
  vim.cmd('set nowrap')
  vim.cmd('set iskeyword+=-')
  vim.cmd('set wildmode=longest,list,full')
  vim.cmd('set formatoptions=jql')
  vim.cmd('set go=a')
  vim.cmd('set complete=.,w,b,u,t,i,kspell')
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

-- local function set_vim_bo()
--   vim.bo.formatoptions = 'jql'
-- end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true, silent = true }

  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)
  map('n', '<M-S-l>', ':vertical resize -2<CR>', options)
  map('n', '<M-S-h>', ':vertical resize +2<CR>', options)

  -- Easy CAPS
  map('i', '<C-u>', '<ESC>viwUi', options)
  map('n', '<C-u>', 'viwU<ESC>', options)
end


local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  -- set_vim_bo()
  set_keymaps()
end

return {
  init = init
}
