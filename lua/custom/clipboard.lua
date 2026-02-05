local M = {}

local function is_ssh()
  return vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_TTY ~= nil
end

function M.setup()
  if not is_ssh() then
    return
  end

  local ok, osc52 = pcall(require, 'osc52')
  if not ok then
    return
  end

  osc52.setup {
    max_length = 0,
    silent = true,
    trim = true,
  }

  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      -- solo yank
      if vim.v.event.operator ~= 'y' then
        return
      end

      -- testo yankato (array di righe)
      local contents = vim.v.event.regcontents
      if type(contents) ~= 'table' or #contents == 0 then
        return
      end

      -- unisci le righe in stringa
      local text = table.concat(contents, '\n')
      osc52.copy(text)
    end,
  })
end

return M
