local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }

  use({
  'Wansmer/treesj',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
})
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
  use 'rcarriga/nvim-notify'
use { 'echasnovski/mini.nvim', branch = 'stable' }
use 'williamboman/mason.nvim'    
    	use 'williamboman/mason-lspconfig.nvim'
 	use 'neovim/nvim-lspconfig' 
    	use 'simrat39/rust-tools.nvim'  
	-- Completion framework:
    	use 'hrsh7th/nvim-cmp' 
	use 'rockerBOO/boo-colorscheme-nvim'	
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
use 'kvrohit/mellow.nvim'
    	-- LSP completion source:
    	use 'hrsh7th/cmp-nvim-lsp'
	    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use("nvim-lua/plenary.nvim") 
-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status

use 'm4xshen/autoclose.nvim'
    	-- Useful completion sources:
	use 'andweeb/presence.nvim'
    	use 'hrsh7th/cmp-nvim-lua'
    	use 'hrsh7th/cmp-nvim-lsp-signature-help'
    	use 'hrsh7th/cmp-vsnip'                             
    	use 'hrsh7th/cmp-path'                              
    	use 'hrsh7th/cmp-buffer'                            
    	use 'hrsh7th/vim-vsnip' 
	use 'tanvirtin/monokai.nvim'
	use "rebelot/kanagawa.nvim"
	use {'iamcco/markdown-preview.nvim'}
    use 'ful1e5/onedark.nvim'
use {
    'chikko80/error-lens.nvim',
    requires = {'nvim-telescope/telescope.nvim'}
}
use({ "typicode/bg.nvim" })
	use {
  'dinhhuy258/git.nvim'
}
	use {'neoclide/coc.nvim', branch = 'release'}

-- snippets
use "NLKNguyen/papercolor-theme"
use("L3MON4D3/LuaSnip") -- snippet engine
use("saadparwaiz1/cmp_luasnip") -- for autocompletion
use("rafamadriz/friendly-snippets") -- useful snippets
	-- Lua
use {
  "folke/which-key.nvim"}
	-- file explorer
use("nvim-tree/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")

use("nvim-tree/nvim-web-devicons")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
