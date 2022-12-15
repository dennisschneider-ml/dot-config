local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    fast_wrap = {},
})

npairs.add_rule(Rule("$$", "$$", "tex"))
npairs.add_rule(Rule("$", "$", "tex"))

