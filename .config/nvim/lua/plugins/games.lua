return {
    --[[{
        'luk400/vim-lichess',
        event = 'VeryLazy',
        config = function ()
            vim.g.lichess_api_token = 'lip_'
            vim.g.lichess_time = 10
            vim.g.lichess_increment = 0
            vim.g.lichess_rated = 0
            vim.g.lichess_variant = 'standard'
            vim.g.lichess_color = 'random'

            vim.g.python_cmd = 'python3'
            vim.g.lichess_debug_level = -1
        end
    },]] --
    {
        'alec-gibson/nvim-tetris',
        cmd = 'Tetris'
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood'
    },
    {
        "marcussimonsen/let-it-snow.nvim",
        cmd = "LetItSnow", -- Wait with loading until command is run
        opts = {
            delay = 200
        },
    }
}
