local function init()
  require'nvim-treesitter.configs'.setup{
    ensure_installed = {
      'bash',
      'css',
      'dockerfile',
      'go',
      'gomod',
      'graphql',
      'hcl',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'python',
      'rust',
      'tsx',
      'typescript',
      'yaml',
    },
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true,
      disable = {"python"}
    }
  }

  --vim.cmd[[set foldmethod=expr]]
  --vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
end

return {
  init = init
}
