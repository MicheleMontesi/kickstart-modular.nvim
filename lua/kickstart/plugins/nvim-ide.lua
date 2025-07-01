return {
  'ldelossa/nvim-ide',
  lazy = false,
  config = function()
    -- Caricamento esplicito dei componenti per evitare nil references
    local bufferlist = require 'ide.components.bufferlist'
    local explorer = require 'ide.components.explorer'
    local outline = require 'ide.components.outline'
    local callhierarchy = require 'ide.components.callhierarchy'
    local timeline = require 'ide.components.timeline'
    local terminal = require 'ide.components.terminal'
    local terminalbrowser = require 'ide.components.terminal.terminalbrowser'
    local changes = require 'ide.components.changes'
    local commits = require 'ide.components.commits'
    local branches = require 'ide.components.branches'
    local bookmarks = require 'ide.components.bookmarks'

    require('ide').setup {
      -- Icon set: "default", "nerd", "codicon"
      icon_set = 'nerd',

      -- Logging: "debug", "info", "warn", "error"
      log_level = 'warn',

      -- Global + component-specific keymaps
      components = {
        global_keymaps = {
          -- Esempio: tutte le componenti si chiudono con 'H'
          hide = 'H',
        },
        -- Esempio di keymap specifica solo per Explorer
        Explorer = {
          keymaps = {
            hide = 'x',
            jump = '<CR>',
            expand = 'zo',
            collapse = 'zc',
          },
        },
      },

      -- Pannelli di default all'apertura
      panels = {
        left = 'explorer',
        right = 'git',
      },

      -- Gruppi di componenti associati ai pannelli
      panel_groups = {
        explorer = {
          outline.Name,
          bufferlist.Name,
          explorer.Name,
          bookmarks.Name,
          callhierarchy.Name,
          -- terminalbrowser.Name,
        },
        terminal = {
          terminal.Name,
        },
        git = {
          changes.Name,
          commits.Name,
          timeline.Name,
          branches.Name,
        },
      },

      -- Comportamento dei workspace
      workspaces = {
        -- Apri automaticamente i pannelli: "left", "right", "both", "none"
        auto_open = 'both',
        -- Chiudi automaticamente i pannelli quando il tab viene chiuso
        auto_close = true,
        -- Chiudi i pannelli se chiudi l’ultimo buffer
        close_if_last_window = true,
        -- Quando esci da nvim
        on_quit = 'close', -- oppure: "keep"
      },

      -- Dimensioni dei pannelli
      panel_sizes = {
        left = 35,
        right = 35,
        bottom = 15,
      },
    }
  end,
}
