function openZathuraIfConditionMet()
  local firstLine = vim.fn.substitute(vim.fn.getline(1), '^\\[//\\]:\\s*', '', '')
  if firstLine ~= '' then
    vim.fn.system("zathura " .. vim.fn.shellescape(firstLine))
  else
    print("First line does not start with [//]:")
  end
end

vim.api.nvim_set_keymap('n', '<leader>o', [[:lua openZathuraIfConditionMet()<CR>]], { noremap = true, silent = true })
