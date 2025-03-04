# Cosine Color Scheme

A customizable and elegant color scheme for Neovim with support for multiple plugins and both light and dark variants.

## Features

- 🎨 Easy customization through Lua tables
- 🌓 Dark and light mode support
- 🔌 Support for popular plugins:
  - Treesitter
  - LSP
  - Telescope
  - NvimTree
  - Git signs
  - And more!
- 🛠️ Fully configurable highlights
- 🚀 Written in Lua for optimal performance

## Installation

### Using Packer

```lua
use {
  'cosine/colors',
  config = function()
    require('cosine').setup()
  end
}
```

### Using Lazy.nvim

```lua
{
  'cosine/colors',
  lazy = false, -- load during startup
  priority = 1000, -- load before other plugins
  config = function()
    require('cosine').setup()
  end,
}
```

## Usage

### Basic Setup

Add this to your Neovim configuration:

```lua
require('cosine').setup({
  -- Options (all are optional)
  theme = 'dark', -- 'dark' or 'light'
  transparent = false, -- Enable transparent background
  italic_comments = true, -- Use italics for comments
  -- Other options...
})
```

### Setting the Color Scheme

After installation, you can set the color scheme manually:

```lua
vim.cmd('colorscheme cosine')
```

### Customization

You can customize specific highlight groups:

```lua
require('cosine').setup({
  override = {
    -- Override specific highlight groups
    Comment = { fg = '#888888', italic = true },
    Function = { fg = '#7e9cd8', bold = true },
    -- Add more overrides as needed
  }
})
```

## Configuration Options

| Option            | Default | Description                           |
|-------------------|---------|---------------------------------------|
| `theme`           | `'dark'`| Color scheme variant (`'dark'` or `'light'`) |
| `transparent`     | `false` | Enable transparent background         |
| `italic_comments` | `true`  | Use italic font for comments          |
| `bold_keywords`   | `true`  | Use bold font for keywords            |
| `override`        | `{}`    | Table of highlight groups to override |

## Terminal Colors

For full experience, you can also set the terminal colors in your terminal emulator to match the color scheme. See the `colors` directory for terminal color configurations.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Inspired by various Neovim color schemes
- Thanks to all contributors and users for feedback and suggestions
