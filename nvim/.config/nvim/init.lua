require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"
local is_linux = has "unix"

if is_mac then
  require('unix')
end
if is_mac then
  require('windows')
end
if is_linux then
  require('unix')
end
