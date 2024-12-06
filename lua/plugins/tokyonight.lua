return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme "tokyonight-night"
            --      vim.cmd.hi 'Comment gui=none'
            --      vim.cmd.hi 'Normal guibg = none'
        end,
    },
}
