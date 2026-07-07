local M = {}
local config = require('homegrown.config')

local function normalize_opts(opts)
    local normalized = {}
    for key, val in pairs(opts or {}) do
        if type(val) == 'boolean' then
            normalized[key] = { enabled = val }
        elseif type(val) == 'table' then
            normalized[key] = vim.tbl_extend('force', { enabled = true }, val)
        else
            normalized[key] = val
        end
    end
    return normalized
end

function M.setup(opts)
    local normalized = normalize_opts(opts)
    config.set(normalized)

    if config.options.bracket_nav.enabled then
        require('homegrown.bracket_nav').setup()
    end
    if config.options.highlighter.enabled then
        require('homegrown.highlighter').setup()
    end
    if config.options.copy.enabled then
        require('homegrown.copy').setup()
    end
    if config.options.dir.enabled then
        require('homegrown.dir').setup()
    end
    if config.options.md_preview.enabled then
        require('homegrown.md_preview').setup()
    end
    if config.options.pairs.enabled then
        require('homegrown.pairs').setup()
    end
    if config.options.replace.enabled then
        require('homegrown.replace').setup()
    end
    if config.options.runner.enabled then
        require('homegrown.runner').setup()
    end
    if config.options.terminal.enabled then
        require('homegrown.terminal').setup()
    end
    if config.options.tmux.enabled then
        require('homegrown.tmux').setup()
    end
    if config.options.tiling.enabled then
        require('homegrown.tiling').setup()
    end
end

return M
