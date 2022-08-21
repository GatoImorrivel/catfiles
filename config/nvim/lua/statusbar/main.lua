local filename = require('statusbar._filename')
local lineinfo = require('statusbar._lineinfo')
local mode = require('statusbar._mode')
local fileicon = require('statusbar._fileicon')
local bar = require('statusbar._barline')
local git = require('statusbar._git')

-- Main status line
Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#StatusLine#",
    mode.update_mode_colors(),
    mode.mode(),
    "%#StatuslineText# ",
    fileicon.get_file_icon(),
    filename.filename(),
    "%#StatusLine#",
    "%=%#StatusLine#",
    "%#StatuslineText#",
    git.branch(),
    lineinfo.lineinfo(),
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatuslineTextine#   NvimTree"
end

Statusline.tabline_init = function()
  vim.o.tabline = bar.init()
end

-- Apply status line
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

return Statusline
