local ensure_installed = {
  'bash',
  'c',
  'caddy',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Installa solo i parser mancanti (evita reinstall ad ogni avvio)
      local installed = require('nvim-treesitter').get_installed 'parsers'
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #missing > 0 then
        require('nvim-treesitter').install(missing)
      end

      -- Nuova API: highlight/indent si abilitano manualmente per FileType
      vim.api.nvim_create_autocmd('FileType', {
        pattern = ensure_installed,
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
