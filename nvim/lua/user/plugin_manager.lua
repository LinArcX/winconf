vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function(use)
  -- essential
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- fuzzy
  use 'nvim-telescope/telescope.nvim'

  use 'LinArcX/telescope-changes.nvim'
  require('telescope').load_extension('changes')

  use { "LinArcX/telescope-scriptnames.nvim" }
  require('telescope').load_extension('scriptnames')

  use { "LinArcX/telescope-env.nvim" }
  require('telescope').load_extension('env')

  --use { 'junegunn/fzf', run = ':execute fzf#install()' }
  --use 'junegunn/fzf.vim'
  --use { "ibhagwan/fzf-lua",
  --  -- optional for icon support
  --  requires = { "nvim-tree/nvim-web-devicons" }
  --}

  -- development
  use 'lewis6991/gitsigns.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update
  --use "romgrk/nvim-treesitter-context"
  use 'L3MON4D3/LuaSnip'
  use 'RRethy/vim-illuminate'

  -- lsp
  use 'neovim/nvim-lspconfig'
    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
  use 'nvim-lua/lsp-status.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }
    -- maybe
    -- use 'smjonas/inc-rename.nvim'
    -- use 'ojroques/nvim-lspfuzzy'
    -- use 'gfanto/fzf-lsp.nvim'

  -- utility
  use 'norcalli/nvim-colorizer.lua'
  require('colorizer').setup()

  use 'petertriho/nvim-scrollbar'
  require('scrollbar').setup()

  use 'MunifTanjim/nui.nvim'
  use 'dstein64/vim-startuptime'
  use 'danilamihailov/beacon.nvim'
  use 'MattesGroeger/vim-bookmarks'
  use 'folke/which-key.nvim'
  use 'kyoh86/momiji'
  use 'Mofiqul/vscode.nvim'

end,
config = {
  display = {
    open_fn  = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
})