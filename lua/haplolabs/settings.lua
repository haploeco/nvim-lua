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

  utils.create_augroup({
    { 'BufNewFile', '~/projects/vimwiki/diary/*.md', ':silent 0r !~/.local/bin/generate-vimwiki-diary-template \'%s\'' },
  }, '_VimWikiDiaryTemplate')
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
    splitright = true,
    wildmode = [[longest,list,full]],
    secure = true,
    updatetime = 300,
    timeoutlen = 500
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.clipboard = 'unnamedplus'
  vim.o.shortmess = vim.o.shortmess .. 'c'
  vim.cmd('set iskeyword+=-')
  vim.cmd('set go=a')
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
  vim.bo.complete=[[.,w,b,u,t,i,kspell]]
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true, silent = true }
  local options_expr = { noremap = true, silent = true, expr = true }

  -- Better window navigation
  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)

  -- Resizing panes
  map('n', '<C-Up>', ':resize -2<CR>', options)
  map('n', '<C-Down>', ':resize +2<CR>', options)
  map('n', '<C-Left>', ':vertical resize +2<CR>', options)
  map('n', '<C-Right>', ':vertical resize -2<CR>', options)

  -- Moving text
  map('v', 'J', [[:m '>+1<cr>gv=gv]], options)
  map('v', 'K', [[:m '<-2<cr>gv=gv]], options)
  map('i', '<C-k>', [[<esc>:m .-2<CR>==i]], options)
  map('i', '<C-j>', [[<esc>:m .+1<CR>==i]], options)
  map('n', '<leader>mk', [[:m .-2<CR>==]], options)
  map('n', '<leader>mj', [[:m .+1<CR>==]], options)

  -- Alt-tab through vim tabs
  map('n', '<A-Tab>', ':tabnext<cr>', options)
  map('n', '<A-S-Tab>', ':tabprev<cr>', options)
  map('n', '<leader><Tab>', ':bnext<cr>', options)
  map('n', '<leader>n<Tab>', ':bprev<cr>', options)

  -- Make Y work like C or D - to the end of line
  map('n', 'Y', 'y$', options)

  -- Keeping it centered
  map('n', 'n', 'nzzzv', options)
  map('n', 'N', 'Nzzzv', options)
  map('n', 'J', 'mzJ`z', options)
  map('n', '<C-j>', ':cnext<CR>zzzv', options)

  -- Undo break points
  map('i', ',', ',<C-g>u', options)
  map('i', '.', '.<C-g>u', options)
  map('i', '!', '!<C-g>u', options)
  map('i', '?', '?<C-g>u', options)

  -- Don't lose visual selection on indent
  map('v', '<', '<gv', options)
  map('v', '>', '>gv', options)

  -- Add count movements to jumplist
  map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', options_expr)
  map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', options_expr)

  -- Toggle Nvim Tree
  map('n', '<C-e>', ':NvimTreeToggle<CR>', options)

  -- Replace highlighted text with clipboard without messing up registers
  map('v', '<leader>p', '"_dP', options)

  map('n', '<leader>y', '"+y', options)
  map('v', '<leader>y', '"+y', options)
  map('n', '<leader>Y', 'gg"+yG', options)

  map('n', '<leader>d', '"_d', options)
  map('v', '<leader>d', '"_d', options)

  map('i', '<C-c>', '<esc>', options)
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
