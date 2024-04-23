return {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup {
      fps = 60,
      timeout = 3000,
      top_down = false,
      background_colour = "#000000",
    }
    vim.notify = require("notify")
  end
}
