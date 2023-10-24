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
	  use ('theprimeagen/harpoon')
	  use ('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
	  use ('ellisonleao/gruvbox.nvim')
	  use ('mbbill/undotree')
	  use ('tpope/vim-fugitive')
    use ('jiangmiao/auto-pairs')
    use ('terrortylor/nvim-comment')
    use ('lewis6991/gitsigns.nvim')
    use ('windwp/nvim-autopairs')
    use ('leafOfTree/vim-matchtag')
    use ('Yggdroot/indentLine')
    use ('mattn/emmet-vim')
	  use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.3',
		  -- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
	  }
	  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  	-- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    use("christoomey/vim-tmux-navigator")
    use("preservim/nerdtree")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
