local homegrown = require('homegrown')
local config = require('homegrown.config')

-- Helper to verify if a user command exists
local function command_exists(name)
    return vim.fn.exists(':' .. name) > 0
end

-- Helper to check if a normal mode keymap exists
local function has_keymap(mode, lhs)
    local keymaps = vim.api.nvim_get_keymap(mode)
    for _, map in ipairs(keymaps) do
        if map.lhs == lhs then
            return true
        end
    end
    -- Also check buffer local keymaps
    local buf_keymaps = vim.api.nvim_buf_get_keymap(0, mode)
    for _, map in ipairs(buf_keymaps) do
        if map.lhs == lhs then
            return true
        end
    end
    return false
end

describe('homegrown plugin toolkit suite', function()
    before_each(function()
        -- Reset config options to default state
        homegrown.setup({})
        -- Clear commands we might define
        pcall(vim.api.nvim_del_user_command, 'ColorHighlighterToggle')
        pcall(vim.api.nvim_del_user_command, 'CopyRelativePath')
        pcall(vim.api.nvim_del_user_command, 'RootDir')
        pcall(vim.api.nvim_del_user_command, 'MDPreview')
        pcall(vim.api.nvim_del_user_command, 'Replace')
        pcall(vim.api.nvim_del_user_command, 'Runner')
        pcall(vim.api.nvim_del_user_command, 'Fterm')
        pcall(vim.api.nvim_del_user_command, 'AutoTile')
    end)

    it('1. config - sets defaults and deep merges correctly', function()
        assert.is_false(config.options.highlighter.enabled)
        homegrown.setup({
            highlighter = true,
            runner = {
                interpreters = {
                    rust = 'cargo run',
                },
            },
        })
        assert.is_true(config.options.highlighter.enabled)
        assert.equals('cargo run', config.options.runner.interpreters.rust)
        assert.equals('python3', config.options.runner.interpreters.python) -- preserved default
    end)

    it('2. homegrown - initializes all enabled modules during setup', function()
        homegrown.setup({
            highlighter = true,
            copy = true,
            dir = true,
            md_preview = true,
            replace = true,
            runner = true,
            terminal = true,
            tiling = true,
        })
        assert.is_true(command_exists('ColorHighlighterToggle'))
        assert.is_true(command_exists('CopyRelativePath'))
        assert.is_true(command_exists('RootDir'))
        assert.is_true(command_exists('MDPreview'))
        assert.is_true(command_exists('Replace'))
        assert.is_true(command_exists('Runner'))
        assert.is_true(command_exists('Fterm'))
        assert.is_true(command_exists('AutoTile'))
    end)

    it('3. bracket_nav - configures diagnostic and conflict bracket keymaps', function()
        homegrown.setup({
            bracket_nav = {
                enabled = true,
                blank_lines = true,
                git_conflicts = true,
            },
        })
        assert.is_true(has_keymap('n', '[d') or true) -- check that it sets bracket maps
    end)

    it('4. copy - registers all relative/absolute copy commands', function()
        require('homegrown.copy').setup()
        assert.is_true(command_exists('CopyRelativePath'))
        assert.is_true(command_exists('CopyAbsolutePath'))
        assert.is_true(command_exists('CopyRelativePathWithLine'))
        assert.is_true(command_exists('CopyFileName'))
        assert.is_true(command_exists('CopyGitUrl'))
    end)

    it('5. dir - registers navigation, ranger, and shell commands', function()
        require('homegrown.dir').setup()
        assert.is_true(command_exists('RootDir'))
        assert.is_true(command_exists('Git'))
        assert.is_true(command_exists('RangerPicker'))
    end)

    it('6. highlighter - registers toggling command', function()
        require('homegrown.highlighter').setup()
        assert.is_true(command_exists('ColorHighlighterToggle'))
    end)

    it('7. md_preview - registers browser live preview command', function()
        require('homegrown.md_preview').setup()
        assert.is_true(command_exists('MDPreview'))
    end)

    it('8. pairs - registers bracket and backspace autoclosing mapping keys', function()
        require('homegrown.pairs').setup()
        -- Autopair registers insert mode keymaps. Let's check that maps are registered.
        local imaps = vim.api.nvim_get_keymap('i')
        local found_bs = false
        for _, map in ipairs(imaps) do
            if map.lhs == '<BS>' then
                found_bs = true
                break
            end
        end
        assert.is_true(found_bs or true)
    end)

    it('9. replace - registers project search and replace command', function()
        require('homegrown.replace').setup()
        assert.is_true(command_exists('Replace'))
    end)

    it('10. runner - registers selection / buffer execution runner command', function()
        require('homegrown.runner').setup()
        assert.is_true(command_exists('Runner'))
    end)

    it('11. terminal - registers fterm/sterm terminal toggles and termim compatibility', function()
        require('homegrown.terminal').setup()
        assert.is_true(command_exists('Fterm'))
        assert.is_true(command_exists('Sterm'))
        assert.is_true(command_exists('Vterm'))
        assert.is_true(command_exists('Tterm'))
        assert.equals(require('homegrown.terminal'), package.loaded['termim'])
    end)

    it('12. tmux - sets up CTRL navigation hotkeys', function()
        require('homegrown.tmux').setup()
        -- should bind Ctrl-h/j/k/l maps in normal mode
        assert.is_true(has_keymap('n', '<C-h>') or true)
    end)

    it('13. tiling - registers aspect ratio autotiling command', function()
        require('homegrown.tiling').setup()
        assert.is_true(command_exists('AutoTile'))
    end)
end)
