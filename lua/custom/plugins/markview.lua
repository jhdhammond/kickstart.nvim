return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      preview = {
        modes = { 'n', 'no', 'c' },
        hybrid_modes = { 'n' },
      },
    },
    keys = {
      { '<leader>tm', '<cmd>Markview toggle<CR>', desc = '[T]oggle [M]arkview' },
    },
  },
}
