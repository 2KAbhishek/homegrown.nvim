local M = {}

local function get_root_dir()
    local bufname = vim.fn.expand('%:p')
    if bufname == '' then
        return ''
    end

    local parent = vim.fn.fnamemodify(bufname, ':h')
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.shellescape(parent) .. ' rev-parse --show-toplevel')
    if vim.v.shell_error == 0 and #git_root > 0 and git_root[1] ~= '' then
        return git_root[1]
    else
        return parent
    end
end

function M.setup()
    -- Switch to git root or file parent dir
    vim.api.nvim_create_user_command('RootDir', function()
        local root = get_root_dir()
        if root == '' then
            return
        end
        vim.cmd('lcd ' .. vim.fn.fnameescape(root))
    end, {})

    -- Runs generic git commands in the background and prints output
    if vim.fn.exists(':Git') == 0 then
        vim.api.nvim_create_user_command('Git', function(opts)
            local output = vim.fn.system('git ' .. opts.args)
            vim.notify(output, vim.log.levels.INFO)
        end, { nargs = '*' })
    end

    -- Ranger file picker floating window
    vim.api.nvim_create_user_command('RangerPicker', function()
        if not _G.Snacks or not _G.Snacks.terminal then
            local has_snacks, snacks = pcall(require, 'snacks')
            if not has_snacks or not snacks.terminal then
                vim.notify('snacks.nvim is required for RangerPicker', vim.log.levels.ERROR)
                return
            end
            _G.Snacks = snacks
        end

        local temp = vim.fn.tempname()
        local terminal = _G.Snacks.terminal.open('ranger --choosefile=' .. temp)
        vim.api.nvim_create_autocmd('TermClose', {
            buffer = terminal.buf,
            once = true,
            callback = function()
                vim.schedule(function()
                    if vim.fn.filereadable(temp) == 1 then
                        vim.cmd('edit ' .. vim.fn.fnameescape(vim.fn.readfile(temp)[1]))
                        vim.fn.delete(temp)
                    end
                end)
            end,
        })
    end, {})

    -- Select filetype for current buffer
    vim.api.nvim_create_user_command('SelectFileType', function()
        local fts = vim.fn.getcompletion('', 'filetype')
        vim.ui.select(fts, { prompt = 'Select Filetype: ' }, function(choice)
            if choice and choice ~= '' then
                vim.bo.filetype = choice
            end
        end)
    end, {})
end

return M
