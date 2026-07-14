local homegrown = require('homegrown')

describe('homegrown', function()
    it('sets up successfully with default options', function()
        homegrown.setup()
        assert(type(homegrown.setup) == 'function')
    end)
end)
