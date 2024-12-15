-- Highlight todo, notes, etc in comments
return {
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = true },
    },
}
-- Keyword Examples:
-- TODO: do something
-- WARNING: ???
-- PERF: fully optimized
-- HACK: weird code warning
-- NOTE: adding a note
-- FIX: needs fixing
-- TEST: This is a test

-- vim: ts=2 sts=2 sw=2 et
