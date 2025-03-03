local mocha = require("catppuccin.palettes").get_palette "mocha"
require('bufferline').setup({
    options = {
        indicator = {
            icon = ' '
        },
        show_close_icon = false,
        tab_size = 0,
        max_name_length = 25,
        offsets = {{
            filetype = 'NvimTree',
            text = '  Files',
            highlight = 'StatusLine',
            text_align = 'left'
        }},
        separator_style = 'slant',
        modified_icon = '',
        custom_areas = {
            left = function()
                return {{
                    text = '    ',
                    fg = '#8fff6d'
                }}
            end
        }
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = {"italic", "bold"},
        custom = {
            all = {
                fill = {
                    bg = "#000000"
                }
            },
            mocha = {
                background = {
                    fg = mocha.text
                }
            },
            latte = {
                background = {
                    fg = "#000000"
                }
            }
        }
    }
})

