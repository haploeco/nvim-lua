local builtin = require("telescope.builtin")
local finders = {}

function finders.vimrc()
  builtin.find_files({
    prompt_title = "Configuration",
    cwd = "$HOME/.config/nvim",
  })
end

function finders.find_files()
  builtin.find_files({
    prompt_title = "TestThisOut",
    find_command = {
      "rg",
      "-g", "!.git",
      "--files",
      "--hidden",
      "--no-ignore-global"
    }
  })
end

function finders.ripgrep()
  builtin.grep_string({
    find_command = {
      "rg",
      "-g", "!.git",
      "--hidden",
      "--no-ignore-global",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    search = "",
  })
end

return finders

