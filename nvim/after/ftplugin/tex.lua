function build_tex()
  local current_file_name = vim.fn.expand('%:t')
  vim.api.nvim_command_output(":!xelatex "..current_file_name)
end

function view_pdf()
  local pdf_file_name = vim.fn.expand('%:r')
  vim.api.nvim_command_output(":!zathura "..pdf_file_name..".pdf")
end

function remove_temp_files()
  local root_file_name = vim.fn.expand('%:r')
  vim.api.nvim_command_output(":!rm "..root_file_name..".aux")
  vim.api.nvim_command_output(":!rm "..root_file_name..".log")
  vim.api.nvim_command_output(":!rm "..root_file_name..".out")
  vim.api.nvim_command_output(":!rm "..root_file_name..".pdf")
end

table.insert(require('command_palette').CpMenu,
  {"tex",
    { 'clear', ":lua remove_temp_files()" },
    { 'view', ":lua view_pdf()" },
    { 'build', ":lua build_tex()" },
  })
