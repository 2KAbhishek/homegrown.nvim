local M = {}

function M.setup()
    local opts = require('homegrown.config').options.bracket_nav

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
