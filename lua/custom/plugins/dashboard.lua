return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = {
          '',
          '      ___           ___                       ___     ',
          '     /\\__\\         /\\__\\          ___        /\\__\\    ',
          '    /::|  |       /:/  /         /\\  \\      /::|  |   ',
          '   /:|:|  |      /:/  /          \\:\\  \\    /:|:|  |   ',
          '  /:/|:|  |__   /:/__/  ___      /::\\__\\  /:/|:|__|__ ',
          ' /:/ |:| /\\__\\  |:|  | /\\__\\  __/:/\\/__/ /:/ |::::\\__\\',
          ' \\/__|:|/:/  /  |:|  |/:/  / /\\/:/  /    \\/__/~~/:/  /',
          '     |:/:/  /   |:|__/:/  /  \\::/__/           /:/  / ',
          '     |::/  /     \\::::/__/    \\:\\__\\          /:/  /  ',
          '     /:/  /       ~~~~         \\/__/         /:/  /   ',
          '     \\/__/                                   \\/__/    ',
          '',
        },
        week_header = {
          enable = false,
        },
        project = {
          enable = true,
          limit = 8,
          icon = ' ',
          label = ' Projects',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 10,
          icon = ' ',
          label = ' Recent Files',
          cwd_only = false,
        },
        shortcut = {
          {
            desc = ' Find File',
            group = '@property',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Search Text',
            group = 'Label',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            desc = ' Config',
            group = 'Number',
            action = 'Telescope find_files cwd=~/.config/nvim',
            key = 'c',
          },
          {
            desc = '󰒲 Lazy',
            group = '@property',
            action = 'Lazy',
            key = 'l',
          },
          {
            desc = ' Quit',
            group = 'DiagnosticError',
            action = 'qa',
            key = 'q',
          },
        },
        footer = {},
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
