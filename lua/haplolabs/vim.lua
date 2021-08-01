local function set_augroup()

  local utils = require('haplolabs.utils')

  utils.create_augroup({
    { 'FileType', 'markdown', 'setlocal', 'wrap' },
    { 'FileType', 'markdown', 'setlocal', 'spell' },
  }, '_WrapInMarkdown')

  utils.create_augroup({
    {'FileType', '*', 'setlocal', 'shiftwidth=2'},
    {
      'FileType',
      'ocaml,ocaml.ocaml_inteface,lua,nix,javascript,js,ts,tsx,typscript,typescriptreact,html',
      'setlocal',
      'shiftwidth=2'
    },
  }, '_Tab2')

  utils.create_augroup({
    {'BufWinEnter', '*', 'setlocal', 'formatoptions-=c', 'formatoptions-=r', 'formatoptions-=o'},
    {'BufRead', '*', 'setlocal', 'formatoptions-=c', 'formatoptions-=r', 'formatoptions-=o'},
    {'BufNewFile', '*', 'setlocal', 'formatoptions-=c', 'formatoptions-=r', 'formatoptions-=o'},
  }, '_FormatOpts')
end


local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    backup = false,
    ruler = true,
    errorbells = false,
    smarttab = true,
    laststatus = 0,
    hidden = true,
    scrolloff = 3,
    showmode = false,
    termguicolors = true,
    background = 'dark',
    pumheight = 10,
    cmdheight = 2,
    lazyredraw = true,
    showtabline = 2,
    hlsearch = false,
    mouse = 'a',
    backspace = [[indent,eol,start]],
    splitbelow = true,
    splitright = true
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
        r = true,
        o = false,
      }

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set secure')
  vim.cmd('set updatetime=300')
  vim.cmd('set timeoutlen=500')
  vim.cmd('set t_Co=256')
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
  vim.wo.list = true
  vim.wo.cursorline = true
  vim.wo.conceallevel = 0
  vim.wo.scrolloff = 3
end

local function set_vim_bo()
  vim.bo.autoindent = true
  vim.bo.expandtab = true
  vim.bo.softtabstop = 2
  vim.bo.tabstop = 2
  vim.bo.smartindent = true
  vim.bo.modeline = false
  vim.swapfile = false
  vim.bo.synmaxcol = 4000
  vim.bo.fileencoding = 'utf8'
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true, silent = true }

  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)

  map('n', '<M-S-l>', ':vertical resize -2<CR>', options)
  map('n', '<M-S-h>', ':vertical resize +2<CR>', options)

  map('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
  map('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

  map('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
  map('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})

  -- Easy CAPS
  map('i', '<C-u>', '<ESC>viwUi', options)
  map('n', '<C-u>', 'viwU<ESC>', options)
end


local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_vim_bo()
  set_keymaps()
end

return {
  init = init
}
