local function init()
  vim.g.taskwiki_markup_syntax = 1
  vim.g.taskwiki_disable_concealcursor = 1
  vim.g.taskwiki_dont_preserve_folds = 1
  vim.g.vimwiki_folding = ''
end

return {
  init = init
}
