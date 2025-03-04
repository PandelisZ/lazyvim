# Nvim Lua Tree

A simple, efficient file explorer for Neovim written in pure Lua.

## Overview

Nvim Lua Tree is a lightweight file explorer that provides an intuitive way to navigate and manage your project files directly within Neovim. Built entirely in Lua, it's designed to be fast, customizable, and seamlessly integrate with your Neovim workflow.

## Features

- Fast and lightweight file navigation
- Customizable icons and colors
- Folder expansion/collapse functionality
- File operations (open, create, delete, rename)
- Git integration to show file status
- Configurable key mappings

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'yourusername/nvim-lua-tree',
  requires = {
    'nvim-lua/plenary.nvim',  -- If dependency exists
  },
  config = function()
    require('nvim-lua-tree').setup()
  end
}
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'yourusername/nvim-lua-tree',
  dependencies = {
    'nvim-lua/plenary.nvim',  -- If dependency exists
  },
  config = function()
    require('nvim-lua-tree').setup()
  end
}
```

## Configuration

Nvim Lua Tree can be configured by passing options to the setup function:

```lua
require('nvim-lua-tree').setup({
  -- Default configuration with custom options
  icons = {
    directory = {
      open = "▾",
      closed = "▸",
      empty = "▹",
    },
    file = {
      default = "",
      symlink = "",
    }
  },
  colors = {
    directory = "#4b7bec",
    file = "#a5b1c2",
    selected = "#0984e3",
  },
  show_hidden = false,
  width = 30,
  side = "left",  -- "left" or "right"
  auto_close = false,
  follow_current_file = false,
  update_cwd = false,
})
```

## Usage

### Commands

| Command | Description |
|---------|-------------|
| `:NvimLuaTree` | Toggle the file explorer |
| `:NvimLuaTreeOpen` | Open the file explorer |
| `:NvimLuaTreeClose` | Close the file explorer |
| `:NvimLuaTreeFocus` | Focus the file explorer |
| `:NvimLuaTreeRefresh` | Refresh the file explorer |
| `:NvimLuaTreeFindFile` | Find and highlight the current file in the explorer |

### Default Keymaps (within the tree)

| Key | Action |
|-----|--------|
| `<CR>` or `o` | Open file / Expand directory |
| `<BS>` or `x` | Close directory |
| `a` | Create new file/directory |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `y` | Copy file path to clipboard |
| `Y` | Copy file name to clipboard |
| `c` | Copy file |
| `p` | Paste file |
| `R` | Refresh the tree |
| `q` | Close the tree |
| `?` | Show help |

## Default Options

```lua
{
  -- Default values for configuration
  icons = {
    directory = {
      open = "▾",
      closed = "▸",
      empty = "▹",
    },
    file = {
      default = "",
      symlink = "",
    },
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    },
  },
  colors = {
    directory = "#4b7bec",
    file = "#a5b1c2",
    selected = "#0984e3",
    git = {
      unstaged = "#f39c12",
      staged = "#2ecc71",
      unmerged = "#e74c3c",
      renamed = "#3498db",
      untracked = "#e67e22",
      deleted = "#e74c3c",
      ignored = "#7f8c8d",
    },
  },
  show_hidden = false,
  width = 30,
  side = "left",
  auto_close = false,
  follow_current_file = false,
  update_cwd = false,
  hijack_netrw = true,
  hijack_cursor = true,
  respect_buf_cwd = false,
  mappings = {
    custom_only = false,
    list = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
}
```

## TODO

- [ ] Add more customization options for appearance and behavior
- [ ] Improve Git integration with more status indicators
- [ ] Add file preview functionality
- [ ] Implement better symbolic link handling
- [ ] Add file filtering by type or pattern
- [ ] Improve performance for large directories
- [ ] Add multi-select functionality for batch operations
- [ ] Create documentation website with more examples

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT
