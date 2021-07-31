local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'haplolabs.plugins.lspconfig'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'haplolabs.plugins.treesitter'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    requires = {
      {
        'erkrnt/compe-tabnine',
        run = './install.sh'
      },
      'wellle/tmux-complete.vim',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim'
    },
    config = function ()
      require'haplolabs.plugins.compe'.init()
      require'haplolabs.plugins.compe_tabnine'.init()
      require'haplolabs.plugins.lspkind'.init()
    end
  }

  -- tpope stuff
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-sensible'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'rmagatti/session-lens',
    config = function ()
      require'haplolabs.plugins.telescope'.init()
    end
  }

  -- Themes
  use {
    'folke/tokyonight.nvim',
    config = function ()
      require'haplolabs.plugins.tokyonight'.init()
    end
  }
  
  -- Git Support
  use 'rhysd/git-messenger.vim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'haplolabs.plugins.gitsigns'.init()
    end
  }

  -- Sessions
  use {
    'rmagatti/auto-session',
    config = function ()
      require'haplolabs.plugins.auto_session'.init()
    end
  }

  -- Utilities
  use 'unblevable/quick-scope'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'haplolabs.plugins.lualine'.init()
    end
  }

  use 'preservim/nerdcommenter'
  use 'romgrk/nvim-treesitter-context'
  -- Better file tree with nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- VimWiki + Zettelkasten
  use {
    'michal-h21/vim-zettel',
    requires = {
      {
        'junegunn/fzf',
        run = function () vim.fn['fzf#install']() end
      },
      'junegunn/fzf.vim',
      'vimwiki/vimwiki'
    },
    config = function ()
      require'haplolabs.plugins.zettel'.init()
    end
  }

  -- Taskwiki
  use {
    'tools-life/taskwiki',
    requires = {
      'powerman/vim-plugin-AnsiEsc',
      'majutsushi/tagbar',
      'farseer90718/vim-taskwarrior'
    },
    config = function ()
      require'haplolabs.plugins.taskwiki'.init()
    end
  }
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
