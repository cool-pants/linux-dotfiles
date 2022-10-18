local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then end

local sts, tsi = pcall(require, 'nvim-treesitter.install')
if (not sts) then end

tsi.compilers = { "clang", "gcc" }

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'tsx',
    'lua',
    'json',
    'css',
    'fish',
    'dockerfile',
    'python',
    'html',
    'javascript',
    'vim',
    'typescript',
    'go',
  },
  autotag = {
    enable = true,
  }
}
