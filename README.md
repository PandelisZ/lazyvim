# Aesthetic.nvim

**Aesthetic** is a beautiful theme plugin for [Neovim](https://neovim.io) focused on the status line.

![Aesthetic](aesthetic.png)

Current supported filetypes:
- Lua
- Markdown
- Latex
- Python
- C/C++
- Bash
- Nim

**Plugins supported:**
- NvimTree
- Lualine

> Don't see your favorite filetype or plugin here? Please open a PR and submit a cool color scheme!

> Disclaimer: notice that this theme only supports *dark mode*. Also this theme only supports 24-bit RGB colors and is not compatible with terminal (or any editor) colors.

## Installation

Install the plugin with your package manager. For example, using `Packer`:

```lua
use 'rakr/vim-two-firewatch'
use 'larssb/aesthetic.nvim'
```

> Note: this colorscheme makes heavy use of gui, therefore it is not possible to use terminal colors

## Setup

Aesthetic shares two variables:
- `aesthetic_Globals`
- `aesthetic_Colors`

The first variable defines the global attributes of the theme, while the second saves the colors. In general you should not modify `aesthetic_Colors` too much, since this variable is the output of the color palette of the theme, which is defined by the matched editor theme (Firewatch, gruvbox, etc...). On the other hand the `aesthetic_Globals` can be freely modified to adapt the theme to your needs. The `aesthetic_Globals` variables are paired with colors from the `aesthetic_Colors`, so by modifying the colors you will influence the global overriding variables.

Here we show how to set `aesthetic_Globals`, `aesthetic_Colors` and how to enable the theme:

```lua
local globals = require("aesthetic").get_globals()
local default_colors = require("aesthetic").get_default_colors()

local colors = {
    defaults = {
            color1 = default_colors.palette.orange,
            color2 = default_colors.palette.red,
            color3 = default_colors.palette.blue,
            color4 = default_colors.palette.green,
            color5 = default_colors.palette.black,
            color6 = default_colors.palette.cyan,
            color7 = default_colors.palette.teal,
            color8 = default_colors.palette.pink,
         },
        }
    }
}

local globals = {
        terminal_style = "italic",
        vim_mode = {
            colors = {
                n = default_colors.palette.nord11_gui,
                i = default_colors.palette.nord8_gui,
                v = default_colors.palette.nord7_gui,
                [''] = default_colors.palette.nord7_gui,
                V = default_colors.palette.nord7_gui,
                c = default_colors.palette.nord9_gui,
                no = default_colors.palette.nord1_gui,
                s = default_colors.palette.nord7_gui,
                S = default_colors.palette.nord15_gui,
                ic = default_colors.palette.nord4_gui,
                R = default_colors.palette.nord13_gui,
                Rv = default_colors.palette.nord13_gui,
                cv = default_colors.palette.nord1_gui,
                ce= default_colors.palette.nord1_gui,
                r= 'Orange',
                rm = default_colors.palette.nord1_gui,
                ['r?'] = default_colors.palette.nord1_gui,
                ['!'] = 'red',
                t = default_colors.palette.nord3_gui,
            },
        }, --_theme_toggle_bounds_/--
        other_fields = "none"
    }
}

-- Define your own color palette, here we only redefine a single color
local custom_colors = {}
custom_colors["error"] = 'red'

require('aesthetic').setup({globals = globals, theme = "phoenix" colors = custom_colors}) -- returns false if the current
-- theme is not supported, since the global colors sections don't match
-- the grammar of the plugin (aesthetic_Globals and aesthetic_Colors)

-- These functions are only synonyms for readability
local globals = require("aesthetic").get_globals()
local defaults = globals.default


-- Setup aesthetic.nvim with custom colors and globals
require('aesthetic').setup({defaults = defaults, colors = colors})
```

In the above example:
* `palette/lush` defines the color palette ​​(optional, but included to emphasize the color scheme)
* `defaults` defines the default global fields and the settings for each language (the values ​​can be either numbers, strings, or booleans).
* `theme` defines the theme name (see [Themes](#themes))
* `languages` defines custom language settings (optional)
* `other_fields` serves as any other plugin field you may want to diverge
* `default_palette` serves as a way to modify the built colors of aesthetic
* `vim_mode` defines them to show the vim mode in the statusbar (optional)

## Colors

Aesthetic exposes color variables that can be used to create more colors:

> Note: Aesthetic follows humans and goes from 1 to 9 instead of the official 0 to 8 Vim standard.

| `aesthetic_Globals.fg`       | `#ABB2BF`        | `Normal`          |      |
|------------------------------|------------------|-------------------|------|

You can directly refer to these colors directly where needed. 

For example:
```lua
local colors = {
	...
    BufferColor = Color('#000000', 'darkred'); -- first field is the FG_COLOR and the second one is the BG_COLOR
    TipColor = Color('#BBBB55');
    HoverColor = Color('#001200', 'green;');
	...
}
```

## Highlight groups

Then there are highlight groups which map to the various Neovim fields.
they define the line, cursor position, gitsigns, numbers, bufferline, etc.

In the next sections we describe the default settings in Aesthetic.

### Defaults

The `defaults` define the colors and styles for the most standard highlight groups.
The `vim_mode` defines the colors per each vim mode.

### Language support

Aesthetic not only exposes colors but also support for specific filetypes. You can override the following fields:

| Value       | Meaning        | Default                                    |
|-------------|----------------|--------------------------------------------|
| `cursor`     | Cursor position| bright purple in bright and yellow in dark mode |
| `line`   | Line number foreground  | white in dark mode                 |
| `lang`         | Language of the buffer  | See below for language settings                  |
| `data`         | Buffer data  | Current line number                 |
| `regex_scope`  |  See below   |  ()            |
| `side`           |  See below        | buffer                    |
| `func_scope`     |  See below         |  ()              |
| `block_scope`         |  See below       |  {                |
| `option`         | See below            |

In the example:
```lua
defaults = {
    cursor = Color(None, '#888800');
    bufline = Color('#303030', '#F3F3F3');
    numline = Color('#F8F8F8', '#ULlike1235');
    option = 0; -- Icon + Text
    --only: function(client, filetype) return filetype == "c" end;
}
```
Here we defined the default colors for the highlights. In our example, we override the default internal bufferline
color as the Tartarus theme uses, redefine the line number color to yellow and hide the background.

These values are computed just once when the theme is loaded.

The regex_scope, outer_scope and func_scope will be explained in the next sections.

#### Regex scope

The regex_scope deals with the symbols and delimiters of delimitations in the file, e.g. parentheses.
Aesthetic exposes colors for these:

| Value       | Meaning        | Default                                    |
|-------------|----------------|--------------------------------------------|
| `brace_scope`  | Parenthesis scope      |  None, 0           |
| `pango_scope`  | Inner scope       |  []          |
| `highlight_scope`   | Highlight scope       |  []          |
| `tag_scope`