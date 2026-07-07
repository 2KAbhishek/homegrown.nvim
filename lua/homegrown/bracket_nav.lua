local M = {}

M.defaults = {
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
}

function M.setup(opts)
    opts = vim.tbl_deep_extend('force', M.defaults, opts or {})

    for char, map in pairs(opts.mappings) do
        vim.keymap.set('n', '[' .. char, map.prev, { desc = 'Prev ' .. map.desc })
        vim.keymap.set('n', ']' .. char, map.next, { desc = 'Next ' .. map.desc })
    end

    if opts.blank_lines then
        -- Insert blank lines above/below cursor without moving cursor
        vim.keymap.set(
            'n',
            '[<space>',
            ":<C-u>put! =repeat(nr2char(10), v:count1)<bar>']+1<cr>",
            { silent = true, desc = 'Insert blank line above' }
        )
        vim.keymap.set(
            'n',
            ']<space>',
            ":<C-u>put =repeat(nr2char(10), v:count1)<bar>'[-1<cr>",
            { silent = true, desc = 'Insert blank line below' }
        )
    end

    if opts.git_conflicts then
        -- Git Conflicts (<<<<<<<, =======, >>>>>>>)
        local function jump_conflict(forward)
            local flags = forward and 'W' or 'bW'
            vim.fn.search([[^\(<<<<<<<\|=======\|>>>>>>>\)]], flags)
        end

        vim.keymap.set('n', '[x', function()
            jump_conflict(false)
        end, { desc = 'Prev Conflict' })
        vim.keymap.set('n', ']x', function()
            jump_conflict(true)
        end, { desc = 'Next Conflict' })
    end
end

return M
