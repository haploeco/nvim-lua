local function init()
  require'haplolabs.packer'.init()
  require'haplolabs.settings'.init()
  require'haplolabs.lsp.lsp-lua'

end

return {
  init = init
}
