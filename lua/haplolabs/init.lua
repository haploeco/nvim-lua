local function init()
  require'haplolabs.lsp.lsp-lua'
	require'haplolabs.vim'.init()
  require'haplolabs.packer'.init()
end

return {
  init = init
}
