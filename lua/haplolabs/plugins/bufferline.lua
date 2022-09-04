local function init()
  require'bufferline'.setup{
    options = {
      numbers = "buffer_id",
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      separator_style = "slant",
      diagnostics = "nvim_lsp",
    }
  }
end

return {
  init = init
}
