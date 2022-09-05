local truezen = require('true-zen')

vim.g.himalaya_mailbox_picker = 'telescope'

-- read message in zen-mode
vim.keymap.set('n', '<leader><cr>', function() 
    vim.call('himalaya#msg#read')
    truezen.focus()
    truezen.ataraxis() 
end, {noremap=true})

