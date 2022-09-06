local truezen = require('true-zen')
local tzfocus = require('true-zen.focus')
local tzataraxis = require('true-zen.ataraxis')

vim.g.himalaya_mailbox_picker = 'telescope'

-- Open message in zen-mode
-- Close on <Leader><CR>
vim.keymap.set('n', '<Leader><CR>', function() 
    if not tzfocus.running and not tzataraxis.running then
        vim.call('himalaya#msg#read')
        tzfocus.on()
        tzataraxis.on()
    else
        tzataraxis.off()
        tzfocus.off()
        vim.api.nvim_command('quit')
    end
end, {noremap=true})

