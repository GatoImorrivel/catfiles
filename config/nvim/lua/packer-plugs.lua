return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  use 'wincent/base16-nvim'
  use 'NvChad/nvim-colorizer.lua'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sleuth'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })
  use 'KabbAmine/vCoolor.vim'
  use { 'GatoImorrivel/gatoblush.nvim', as = 'gatoblush' }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
end)
