vim.cmd [[
  function! EnableTreesitter()
    :TSEnable highlight
    :TSBufEnable highlight

    :TSEnable rainbow
    :TSBufEnable rainbow

    :TSEnable indent
    :TSBufEnable indent

    :TSEnable incremental_selection
    :TSBufEnable incremental_selection
  endfunction
]]

vim.api.nvim_create_autocmd("VimEnter", {
  command = ":call EnableTreesitter()",
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "make", "cmake",
    "latex", "lua", "glsl",
    "bash", "vim", "yaml", "regex",
    "c", "cpp",
    "python", "rust", "vala", "commonlisp", "zig",
    "html", "http", "json", "markdown", "javascript", "css",
    "go", "java",
    },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

local treesitter =  {}

function treesitter.install()
  -- [TODO] second command is a vim command, but show() run it as external command.
  require("user.ui.telescope").show("Languages", ":TSInstallInfo", ":TSInstall ", "SUCCESS: treesitter.list()")
end

return treesitter