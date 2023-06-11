-- vim: ts=2 sts=2 sw=2 et

return {
  'eandrju/cellular-automaton.nvim',
  lazy = false,
  keys = {
    { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "CellularAutomaton make_it_rain" }
  },
  config = function()
    local M = {
      fps = 30,
      name = "scramble",
    }

    local function is_alphanumeric(c)
      return c >= "a" and c <= "z" or c >= "A" and c <= "Z" or c >= "0" and c <= "9"
    end

    local scramble_word = function(word)
      local chars = {}
      while #word ~= 0 do
        local index = math.random(1, #word)
        table.insert(chars, word[index])
        table.remove(word, index)
      end
      return chars
    end

    M.update = function(grid)
      for i = 1, #grid do
        local scrambled = {}
        local word = {}
        for j = 1, #grid[i] do
          local c = grid[i][j]
          if not is_alphanumeric(c.char) then
            if #word ~= 0 then
              for _, d in pairs(scramble_word(word)) do
                table.insert(scrambled, d)
              end
              word = {}
            end
            table.insert(scrambled, c)
          else
            table.insert(word, c)
          end
        end

        grid[i] = scrambled
      end
      return true
    end

    require("cellular-automaton").register_animation(M)
  end,
}
