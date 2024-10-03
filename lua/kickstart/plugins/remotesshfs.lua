return {
  'nosduco/remote-sshfs.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    -- Refer to the configuration section below
    -- or leave empty for defaults
  },
  keys = {
    {
      '<leader>rsc',
      function()
        require('remote-sshfs.api').connect()
      end,
      desc = '[C]onnect to remote',
    },
    {
      '<leader>rsd',
      function()
        vim.cmd 'cd'
        require('remote-sshfs.api').disconnect()
      end,
      desc = '[D]isconnect from remote',
    },
    {
      '<leader>rse',
      function()
        require('remote-sshfs.api').edit()
      end,
      desc = '[E]dit remote connection informations',
    },
  },
}
