
local function init()
  local actions = require("telescope.actions")

  require'telescope'.setup{
    defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
        "secret.d/.*",
        "%.pem"
      },
      prompt_prefix = " ",
      color_devicons = true,
      layout_strategy = "vertical",
      layout_config = {
        width = 0.80,
        height = 0.90,
        preview_cutoff = 0.5,
        vertical = {
         preview_height = 0.60,
         prompt_position = "bottom",
        },
        horizontal = {
          preview_width = 0.5,
          prompt_position = "bottom",
        }
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-h>"] = actions.preview_scrolling_up,
          ["<C-l>"] = actions.preview_scrolling_down,
        },
      },
    },
  }

  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  -- Builtin
  map('n', '<leader>fe', '<CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>', options)
  map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
  map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
  map('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
  map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
  map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
  map('n', '<leader>fd', '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', options)
  map('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)

  -- Extensions
  map('n', '<leader>fs', '<CMD>lua require("telescope").extensions["session-lens"].search_session()<CR>', options)
  map('n', '<leader>fw', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', options)
end

return {
  init = init,
}
