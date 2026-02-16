return {
  'hedyhli/markdown-toc.nvim',
  main = 'mtoc',
  ft = 'markdown',
  cmd = { 'Mtoc' },
  opts = {
    headings = {
      before_toc = false,
    },
    fences = {
      enabled = true,
      start_text = 'mtoc-start',
      end_text = 'mtoc-end',
    },
    auto_update = true,
    toc_list = {
      markers = '*',
      cycle_markers = false,
    },
  },
}
