local g = vim.g

g.himalaya_mailbox_picker = 'telescope'

-- read message in zen-mode
vim.keymap.set('n', '<leader><cr>', function() 
    vim.call('himalaya#msg#read')
    require('true-zen').focus()
    require('true-zen').ataraxis() 
end, {noremap=true})

