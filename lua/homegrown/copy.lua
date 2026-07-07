local M = {}

local function copy_to_clipboard(content)
    vim.fn.setreg('+', content)
    vim.notify('Copied "' .. content .. '" to the clipboard!', vim.log.levels.INFO)
end

function M.copy_git_url(mode, line1, line2)
    local relative_file = vim.fn.expand('%:.')
    local repo_url = vim.fn.system('git config --get remote.origin.url'):gsub('\n', ''):gsub('%.git$', '')
    if repo_url == '' then
        vim.notify('Not a git repository', vim.log.levels.WARN)
        return
    end

    -- Convert SSH git@github.com:user/repo to HTTPS url
    repo_url = repo_url:gsub('git@github%.com:', 'https://github.com/')
    repo_url = repo_url:gsub('ssh://git@', 'https://')

    local branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
    if branch == '' then
        branch = vim.fn.system('git rev-parse --short HEAD'):gsub('\n', '')
    end
    local start_line = line1
    local end_line = line2
    if mode == 'n' then
        start_line = vim.fn.line('.')
        end_line = start_line
    end

    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local url = string.format('%s/blob/%s/%s#L%d', repo_url, branch, relative_file, start_line)
    if mode == 'v' and start_line ~= end_line then
        url = string.format('%s-L%d', url, end_line)
    end
    copy_to_clipboard(url)
end

function M.setup()
    vim.api.nvim_create_user_command('CopyRelativePath', function()
        copy_to_clipboard(vim.fn.expand('%'))
    end, {})

    vim.api.nvim_create_user_command('CopyAbsolutePath', function()
        copy_to_clipboard(vim.fn.expand('%:p'))
    end, {})

    vim.api.nvim_create_user_command('CopyRelativePathWithLine', function()
        copy_to_clipboard(vim.fn.expand('%') .. ':' .. vim.fn.line('.'))
    end, {})

    vim.api.nvim_create_user_command('CopyAbsolutePathWithLine', function()
        copy_to_clipboard(vim.fn.expand('%:p') .. ':' .. vim.fn.line('.'))
    end, {})

    vim.api.nvim_create_user_command('CopyFileName', function()
        copy_to_clipboard(vim.fn.expand('%:t'))
    end, {})

    vim.api.nvim_create_user_command('CopyGitUrl', function(opts)
        local mode = (opts.range > 0) and 'v' or 'n'
        M.copy_git_url(mode, opts.line1, opts.line2)
    end, { range = '%' })
end

return M
