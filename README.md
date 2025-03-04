# colors.nvim

A lightweight, versatile Lua library for color manipulation in Neovim. This plugin provides a simple and intuitive API for working with colors in various formats, creating color palettes, performing color transformations, and more.

## Features

- Support for multiple color formats (RGB, HSL, Hex)
- Color parsing and conversion between formats
- Color manipulation (lighten, darken, saturate, etc.)
- Gradient generation and color interpolation
- Color palette creation and management
- Highly optimized and lightweight

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {'username/colors.nvim'}
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'username/colors.nvim',
  lazy = false,
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'username/colors.nvim'
```

## Usage

### Basic Color Operations

```lua
local colors = require('colors')

-- Create a color
local red = colors.new("#FF0000")
local blue = colors.new(0, 0, 255)
local green = colors.new({ h = 120, s = 100, l = 50 })

-- Convert between formats
local hex = red:to_hex() -- "#FF0000"
local rgb = red:to_rgb() -- {r = 255, g = 0, b = 0}
local hsl = red:to_hsl() -- {h = 0, s = 100, l = 50}

-- Modify colors
local light_red = red:lighten(20) -- Lighten by 20%
local dark_blue = blue:darken(30) -- Darken by 30%
local desaturated_green = green:desaturate(40) -- Desaturate by 40%
local transparent_red = red:alpha(0.5) -- Set alpha to 0.5
```

### Color Palettes

```lua
local colors = require('colors')

-- Create a palette
local palette = colors.palette({
  background = "#282c34",
  foreground = "#abb2bf",
  comment = "#5c6370",
  red = "#e06c75",
  green = "#98c379",
  blue = "#61afef",
})

-- Access colors from the palette
local bg = palette.background
local fg = palette.foreground

-- Modify palette colors
local light_bg = palette.background:lighten(10)
local dark_fg = palette.foreground:darken(15)
```

### Gradients and Interpolation

```lua
local colors = require('colors')

-- Create a gradient between two colors
local start_color = colors.new("#FF0000") -- Red
local end_color = colors.new("#0000FF") -- Blue

-- Generate 5 colors in a gradient from red to blue
local gradient = colors.gradient(start_color, end_color, 5)

-- Interpolate between two colors (0.0 - 1.0)
local purple = colors.interpolate(start_color, end_color, 0.5) -- 50% between red and blue
```

### Working with Terminal Colors

```lua
local colors = require('colors')

-- Get terminal color
local term_red = colors.terminal(1) -- Terminal color 1 (usually red)

-- Create a color scheme for terminal colors
colors.set_terminal_colors({
  [0] = "#282c34", -- black
  [1] = "#e06c75", -- red
  [2] = "#98c379", -- green
  [3] = "#e5c07b", -- yellow
  [4] = "#61afef", -- blue
  [5] = "#c678dd", -- magenta
  [6] = "#56b6c2", -- cyan
  [7] = "#abb2bf", -- white
  -- ... and so on for bright variants 8-15
})
```

## Advanced Features

### Color Harmonies

```lua
local colors = require('colors')
local base = colors.new("#FF0000") -- Red

-- Generate complementary color
local complementary = base:complementary() -- "#00FFFF" (Cyan)

-- Generate triadic colors
local triadic = base:triadic() -- Returns a table with 3 colors

-- Generate analogous colors
local analogous = base:analogous(5, 15) -- 5 colors, each 15 degrees apart
```

### Color Analysis

```lua
local colors = require('colors')
local color1 = colors.new("#FF0000")
local color2 = colors.new("#0000FF")

-- Calculate contrast ratio
local contrast = colors.contrast(color1, color2) -- WCAG contrast ratio

-- Check color accessibility
local is_accessible = colors.is_accessible(color1, color2, "AA") -- Check if meets WCAG AA standard

-- Find a color with better contrast
local better_color = colors.improve_contrast(color1, color2, "AAA")
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Inspired by color manipulation libraries like [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim)
- Color conversion algorithms based on established mathematical formulas
