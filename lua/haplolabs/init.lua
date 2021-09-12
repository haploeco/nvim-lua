local function init()
  require'haplolabs.packer'.init()
  require'haplolabs.settings'.init()

end

return {
  init = init
}
