local M = {}

M.defaults = {
    bracket_nav = false,
    highlighter = false,
    copy = false,
    dir = false,
    md_preview = false,
    pairs = false,
    replace = false,
    runner = false,
    terminal = false,
    tmux = false,
    tiling = false,
}

function M.setup(opts)
    opts = vim.tbl_deep_extend('force', M.defaults, opts or {})

    if opts.bracket_nav then
        local config = type(opts.bracket_nav) == 'table' and opts.bracket_nav or {}
        require('homegrown.bracket_nav').setup(config)
    end
    if opts.highlighter then
        local config = type(opts.highlighter) == 'table' and opts.highlighter or {}
        require('homegrown.highlighter').setup(config)
    end
    if opts.copy then
        local config = type(opts.copy) == 'table' and opts.copy or {}
        require('homegrown.copy').setup(config)
    end
    if opts.dir then
        local config = type(opts.dir) == 'table' and opts.dir or {}
        require('homegrown.dir').setup(config)
    end
    if opts.md_preview then
        local config = type(opts.md_preview) == 'table' and opts.md_preview or {}
        require('homegrown.md_preview').setup(config)
    end
    if opts.pairs then
        local config = type(opts.pairs) == 'table' and opts.pairs or {}
        require('homegrown.pairs').setup(config)
    end
    if opts.replace then
        local config = type(opts.replace) == 'table' and opts.replace or {}
        require('homegrown.replace').setup(config)
    end
    if opts.runner then
        local config = type(opts.runner) == 'table' and opts.runner or {}
        require('homegrown.runner').setup(config)
    end
    if opts.terminal then
        local config = type(opts.terminal) == 'table' and opts.terminal or {}
        require('homegrown.terminal').setup(config)
    end
    if opts.tmux then
        local config = type(opts.tmux) == 'table' and opts.tmux or {}
        require('homegrown.tmux').setup(config)
    end
    if opts.tiling then
        local config = type(opts.tiling) == 'table' and opts.tiling or {}
        require('homegrown.tiling').setup(config)
    end
end

return M
