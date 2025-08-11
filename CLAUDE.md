# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration based on kickstart.nvim - a single-file, documented starter configuration. The configuration follows a modular plugin approach using lazy.nvim for plugin management.

### Core Structure
- **init.lua**: Main configuration file (46KB) containing all base settings, keymaps, and plugin configurations
- **lua/custom/plugins/**: Directory for custom plugin configurations
  - `harpoon.lua`: File navigation plugin with Telescope integration
- **lua/kickstart/plugins/**: Optional kickstart plugins (debug, lint, autopairs, etc.)

### Key Configuration Patterns
- Leader key: `<space>`
- Nerd Font support enabled (`vim.g.have_nerd_font = true`)
- Tab settings: 2 spaces, expandtab
- Custom escape behavior: Flashes screen red after 3 presses

## Development Commands

### Code Formatting
```bash
# Format Lua files using stylua (configured in .stylua.toml)
stylua init.lua lua/
```

### Plugin Management
```vim
:Lazy             " Open Lazy plugin manager UI
:Lazy update      " Update all plugins
:Mason            " Open Mason LSP/tool installer
```

### Navigation & Search
- `<space>sf` - Search files (Telescope)
- `<space>sg` - Live grep (Telescope)
- `<space>sh` - Search help tags
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Open Harpoon files in Telescope
- `-` - Open oil.nvim file explorer

### LSP Features
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ca` - Code action
- `<leader>rn` - Rename symbol
- `<leader>f` - Format buffer

### Quick Actions
- `<leader>j` - Save current file
- `<leader>J` - Save all buffers
- `;` - Command mode (remapped from `:`)
- `<leader>st` - Open small terminal

## Plugin Architecture

### Core Plugins
1. **telescope.nvim**: Fuzzy finder for files, buffers, LSP symbols
2. **nvim-treesitter**: Syntax highlighting and code understanding
3. **nvim-lspconfig + Mason**: LSP configuration and automatic server installation
4. **nvim-cmp**: Autocompletion with LSP support
5. **gitsigns.nvim**: Git integration in sign column
6. **oil.nvim**: File explorer as buffer
7. **harpoon**: Quick file navigation
8. **conform.nvim**: Code formatting with prettier support for web technologies

### LSP Servers
- **lua_ls**: Lua language server (configured for Neovim API)
- **typescript-tools.nvim**: TypeScript/JavaScript support
- Additional servers installed via Mason on demand

### Formatting Configuration
- Lua: stylua
- JavaScript/TypeScript/React: prettier
- Format on save enabled with 500ms timeout

## Important Patterns

### Plugin Loading
- Uses lazy.nvim with event-based loading (`VimEnter`, `InsertEnter`, etc.)
- Plugins defined inline in init.lua or imported from `lua/custom/plugins/`

### Keymapping Pattern
```lua
vim.keymap.set('n', '<leader>key', function() ... end, { desc = 'Description' })
```

### Autocommand Pattern
```lua
vim.api.nvim_create_autocmd('Event', {
  group = vim.api.nvim_create_augroup('group-name', { clear = true }),
  callback = function() ... end,
})
```

## Testing Approach
No formal test framework configured. Manual testing recommended through:
1. `:checkhealth` - Verify Neovim and plugin health
2. Reload configuration: `:source $MYVIMRC`
3. Check for Lua errors in messages: `:messages`

## Notes
- Configuration targets latest stable and nightly Neovim versions
- External dependencies: git, make, unzip, gcc, ripgrep, npm (for TypeScript)
- Clipboard integration with system clipboard enabled
- Custom dashboard using dashboard-nvim with "Pantera" branding
