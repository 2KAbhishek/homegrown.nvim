local M = {}

M.defaults = {
    split_ratio = 2.0,
}

-- Calculate optimal split command based on active window dimensions
local function get_split_cmd(ratio)
    local width = vim.api.nvim_win_get_width(0)
    local height = vim.api.nvim_win_get_height(0)
    return (width >= height * ratio) and 'vsplit' or 'split'
end

-- Perform a smart autotiled split
function M.split(file, ratio)
    local cmd = get_split_cmd(ratio or M.defaults.split_ratio)
    if file and file ~= '' then
        vim.cmd(cmd .. ' ' .. file)
    else
        vim.cmd(cmd)
    end
end

function M.setup(opts)
    opts = vim.tbl_deep_extend('force', M.defaults, opts or {})

    -- Command to trigger an autotiled split for a file path (or current buffer if empty)
    vim.api.nvim_create_user_command('AutoTile', function(sub_opts)
        M.split(sub_opts.args, opts.split_ratio)
    end, { nargs = '?', complete = 'file' })
end

return M
