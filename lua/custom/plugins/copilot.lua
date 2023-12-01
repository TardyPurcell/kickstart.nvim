return {
  'zbirenbaum/copilot.lua',
  name = 'copilot',
  config = function()
    require('copilot').setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-j>'
        }
      },
    })
    vim.cmd 'Copilot disable'
  end
}
