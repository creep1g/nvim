local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- colorscheme
  use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}
	
  -- alignment
  use 'Vonr/align.nvim'

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Telescore
  use 'nvim-telescope/telescope.nvim'

  -- DADBOD
  use 'tpope/vim-dadbod'
  
  use 'kristijanhusak/vim-dadbod-ui'

  -- Fold code lines
  use{ 'anuvyklack/pretty-fold.nvim',
   config = function()
      require('pretty-fold').setup()
   end
}
 
 -- Auto pair
   use { 'windwp/nvim-autopairs',
   config = function()
   	require('nvim-autopairs').setup()
  end}
	
  use 'turbio/bracey.vim'
  use {'nvim-tree/nvim-web-devicons'}
 -- NvimTree
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Startup screen, will try to personalize this more later  
  use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup { theme = "dashboard" }
  end
}

 -- Vim comentary 
 use {'terrortylor/nvim-comment',
	config = function()
		require('nvim_comment').setup()
	end
 }

 -- Language server
 use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
	}

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- debug
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  --cpp syntax
  use 'tree-sitter/tree-sitter-cpp'
  -- cpp formatting
  use 'jose-elias-alvarez/null-ls.nvim'

  --git
  use 'tpope/vim-fugitive'

  -- Comfy motions
  use 'yuttie/comfortable-motion.vim'

  -- rainbow paranthesese
  use 'p00f/nvim-ts-rainbow'

  use 'junegunn/fzf'

  -- Omnisharp
  use 'OmniSharp/omnisharp-vim'

  --Lualine
  --
  use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Notify
  use {
	"rcarriga/nvim-notify",
    config = function()
           vim.notify = require "notify"
    end
    }
  -- Gitsign
  use {
  'lewis6991/gitsigns.nvim',
   -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
 }
  use {
   'weilbith/nvim-code-action-menu',
   cmd = 'CodeActionMenu',
 }
end)


