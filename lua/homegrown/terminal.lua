local M = {}

M.open = function(command, position)
    if not _G.Snacks or not _G.Snacks.terminal then
        local has_snacks, snacks = pcall(require, 'snacks')
        if not has_snacks or not snacks.terminal then
            vim.notify('snacks.nvim is required for homegrown.terminal module', vim.log.levels.ERROR)
            return
        end
        _G.Snacks = snacks
    end

    -- Map legacy aliases for termim compatibility
    if position == 'split' then
        position = 'bottom'
    elseif position == 'vsplit' then
        position = 'right'
    end

    local cmd = command ~= '' and command or nil
    _G.Snacks.terminal.toggle(cmd, { win = { position = position or 'bottom' } })
end

function M.setup()
    -- Define global package so require('termim') works for other plugins (like exercism.nvim)
    package.loaded['termim'] = M

    -- Register user commands
    vim.api.nvim_create_user_command('Fterm', function(input)
        M.open(input.args, 'float')
    end, { nargs = '*' })

    vim.api.nvim_create_user_command('Sterm', function(input)
        M.open(input.args, 'bottom')
    end, { nargs = '*' })

    vim.api.nvim_create_user_command('Vterm', function(input)
        M.open(input.args, 'right')
    end, { nargs = '*' })

    vim.api.nvim_create_user_command('Tterm', function(input)
        M.open(input.args, 'current')
    end, { nargs = '*' })
end

return M
