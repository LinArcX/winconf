-- [TODO]: should not comment empty lines
 --[TODO]: comment multiple lines.

local comments =  {}

local symbols = {
  c = "//", cpp = "//", go = "//", java = "//", javascript = "//", scala = "//", php = "//", rust = "//",
  ruby = "#", python = "#", sh = "#", profile = "#", bashrc = "#", bashrc_profile = "#", conf = "#",
  bat = "REM",
  lua = "--",
  tex = '%',
  ahk = ";",
  vim = '"',
}

local function first_character_position(input)
  local position = 0
  for counter = 1, #input do
    local character = input:sub(counter, counter)
    if character == " " then
      position = position + 1
    else
      break
    end
  end
  return position
end

function comments.toggle()
  if symbols[vim.bo.filetype] then
    local t= {}
    table.insert(t, symbols[vim.bo.filetype])

    local line_is_commented = false
    local current_line = vim.fn.getline(".")
    local first_non_space_position =first_character_position(current_line)
    local current_line_stripped = require('user.util.strings').trim(current_line)
    local current_line_stripped_table = require('user.util.strings').to_table(current_line_stripped)
    local buffer_type_table = require('user.util.strings').to_table(symbols[vim.bo.filetype])

    for counter = 1, #buffer_type_table do
      if buffer_type_table[counter] == current_line_stripped_table[counter] then
        line_is_commented = true
      else
        line_is_commented = false
      end
    end

    local line_number = vim.api.nvim_win_get_cursor(0)[1]

    if line_is_commented then
     vim.cmd('normal 0')
     local go_to_pos =  ':normal '..(first_non_space_position + 1)..'|'
     vim.cmd(go_to_pos)
     for counter = 1, #buffer_type_table do
       vim.cmd(":normal x")
     end
     vim.cmd('normal `z')
    else
      vim.api.nvim_buf_set_text(0,
        line_number - 1,
        (first_non_space_position),
        line_number - 1,
        (first_non_space_position),
        t)
      vim.cmd('normal mz')
    end
  end
end

return comments