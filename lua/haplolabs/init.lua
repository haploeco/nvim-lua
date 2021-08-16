local function init()
  require'haplolabs.packer'.init()
  require'haplolabs.lsp.lsp-lua'
  require'haplolabs.settings'.init()
end

return {
  init = init
}
