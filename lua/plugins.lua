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
	use("wbthomason/packer.nvim") -- Have packer manage itself
    -- install best plugins
    use {
    "williamboman/mason.nvim"
}
	use({
		"Wansmer/treesj",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({--[[ your config ]]
			})
		end,
	})
	use("feline-nvim/feline.nvim")
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "mhartington/formatter.nvim" })
	use({ "numToStr/Comment.nvim", requires = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	} })
      use 'jwalton512/vim-blade'
  use 'alvan/vim-closetag'
  use 'nvim-lua/completion-nvim'
  use 'psliwka/vim-smoothie'
  use 'terryma/vim-multiple-cursors'

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
    use 'mattn/emmet-vim'
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
    use {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
}
use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup()
  end
}
	use("lewis6991/gitsigns.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			use({
				"nvim-lualine/lualine.nvim",
				requires = { "nvim-tree/nvim-web-devicons", opt = true },
			}),
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("rcarriga/nvim-notify")
    
    use('lewis6991/gitsigns.nvim')

	use({
		"williamboman/mason.nvim",
	})
	use({ "echasnovski/mini.nvim", branch = "stable" })
	use("williamboman/mason-lspconfig.nvim")
	use("simrat39/rust-tools.nvim")
	-- Completion framework:
	use("rockerBOO/boo-colorscheme-nvim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("kvrohit/mellow.nvim")
	-- LSP completion source:
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-lua/plenary.nvim")
	-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons

	use("m4xshen/autoclose.nvim")
	-- Useful completion sources:
	use("andweeb/presence.nvim")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/vim-vsnip")
	use("tanvirtin/monokai.nvim")
	use("rebelot/kanagawa.nvim")
	use("ful1e5/onedark.nvim")
	use({
		"chikko80/error-lens.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})
	use({ "typicode/bg.nvim" })
	use({
		"dinhhuy258/git.nvim",
	})
	use({ "neoclide/coc.nvim", branch = "release" })
	use({
		"neovim/nvim-lspconfig",
		opt = true,
		event = "BufReadPre",
		wants = { "nvim-lsp-installer", "cmp-nvim-lsp", "lua-dev.nvim", "vim-illuminate", "null-ls.nvim" },
		config = function()
			require("config.lsp").setup()
		end,
		requires = {
			"williamboman/nvim-lsp-installer",
			"folke/lua-dev.nvim",
			"RRethy/vim-illuminate",
			"jose-elias-alvarez/null-ls.nvim",
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup({})
				end,
			},
		},
	})

	-- snippets
	use("NLKNguyen/papercolor-theme")
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	-- Lua
	use({
		"folke/which-key.nvim",
	})
	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
