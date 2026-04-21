return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons", -- = kyazdani42/nvim-web-devicons
        },
        ft = "markdown",
        opts = {
            file_types = { "markdown", "md" },
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)
        end,
    },
}
