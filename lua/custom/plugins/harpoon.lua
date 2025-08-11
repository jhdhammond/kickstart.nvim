-- lua/plugins/harpoon.lua (or wherever you keep your plugin specs)
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Add Telescope as a dependency
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED for harpoon setup
    harpoon:setup {}

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- Remove the old <C-e> mapping that toggled the Harpoon quick menu
    -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- This keymapping is now handled by the 'keys' table below
  end,
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon: Add current file',
    },
    -- Map <C-e> to open the Telescope picker with Harpoon files
    {
      '<C-e>',
      function()
        -- We need to define or access the toggle_telescope function here.
        -- A clean way is to define it within the config function as above
        -- and then call it from this key definition.
        -- Since it's defined in the config scope, it's accessible here.
        local harpoon = require 'harpoon'
        local conf = require('telescope.config').values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require('telescope.pickers')
            .new({}, {
              prompt_title = 'Harpoon',
              finder = require('telescope.finders').new_table {
                results = file_paths,
              },
              previewer = conf.file_previewer {},
              sorter = conf.generic_sorter {},
            })
            :find()
        end
        toggle_telescope(harpoon:list())
      end,
      desc = 'Harpoon: Open with Telescope',
    },
    {
      '<C-1>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon: Navigate to file 1',
    },
    {
      '<C-2>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon: Navigate to file 2',
    },

    {
      '<]a>',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Harpoon: Go to previous file',
    },
    {
      '<[a>',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Harpoon: Go to next file',
    },
  },
}
