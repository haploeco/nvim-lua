local function init()
  require'haplolabs.lsp.lsp-lua'
  require'haplolabs.settings'.init()
  require'haplolabs.packer'.init()
end

return {
  init = init
}
