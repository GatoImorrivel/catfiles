require('packer-plugs')
require('nvim-conf')
require('mappings')
require('statusbar.main')

require('onedark').setup({
  style = 'warmer'
})
require('onedark').load()

require('statusbar.main').override_colors()
