return {
    {
        "catppuccin/nvim",
        enabled = false,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "sainnhe/gruvbox-material",
        enabled = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_foreground = "mix"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_float_style = "bright"
            vim.g.gruvbox_material_statusline_style = "material"
            vim.g.gruvbox_material_cursor = "auto"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "rose-pine/neovim",
        enabled = false,
    },
    {
        "folke/tokyonight.nvim",
        enabled = true,
        priority = 1000,
        opts = {},
        config = function ()
            vim.cmd.colorscheme("tokyonight-storm")
        end
    }
}
