local M = {}

M.defaults = {
    bracket_nav = {
        enabled = false,
        mappings = {
            d = { prev = vim.diagnostic.goto_prev, next = vim.diagnostic.goto_next, desc = 'Diagnostic' },
            q = { prev = '<cmd>cprev<cr>', next = '<cmd>cnext<cr>', desc = 'Quickfix' },
            Q = { prev = '<cmd>cfirst<cr>', next = '<cmd>clast<cr>', desc = 'First/Last Quickfix Item' },
            l = { prev = '<cmd>lprev<cr>', next = '<cmd>lnext<cr>', desc = 'Location Item' },
            L = { prev = '<cmd>lfirst<cr>', next = '<cmd>llast<cr>', desc = 'First/Last Location Item' },
            b = { prev = '<cmd>bprev<cr>', next = '<cmd>bnext<cr>', desc = 'Buffer' },
            B = { prev = '<cmd>bfirst<cr>', next = '<cmd>blast<cr>', desc = 'First/Last Buffer' },
            w = { prev = '<C-w>p', next = '<C-w>w', desc = 'Window' },
            j = { prev = '<C-o>', next = '<C-i>', desc = 'Jump' },
        },
        blank_lines = true,
        git_conflicts = true,
    },
    highlighter = {
        enabled = false,
    },
    copy = {
        enabled = false,
    },
    dir = {
        enabled = false,
    },
    md_preview = {
        enabled = false,
    },
    pairs = {
        enabled = false,
    },
    replace = {
        enabled = false,
    },
    runner = {
        enabled = false,
    },
    terminal = {
        enabled = false,
    },
    tmux = {
        enabled = false,
    },
    tiling = {
        enabled = false,
        split_ratio = 2.0,
    },
}

M.options = {}

function M.set(opts)
    M.options = vim.tbl_deep_extend('force', M.defaults, opts or {})
end

return M
