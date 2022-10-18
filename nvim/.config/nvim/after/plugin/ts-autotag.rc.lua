local status, autotag = pcall(require, 'nvim-ts-autotag')
if (not status) then return end

local filetypes = {
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
    'django-html', 'htmldjango', 'jinja.html', 'django',
    'xml',
    'php',
    'markdown',
    'glimmer','handlebars','hbs'
}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}

autotag.setup({
  filetypes = filetypes,
  skip_tags = skip_tags
})
