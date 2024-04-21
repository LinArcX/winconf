local file =  {}

function file.read_file_and_return_lines_as_table(path)
  local rows = {}
  local m_file = io.open(path, "rb")
  if not m_file then return nil end

  for line in io.lines(path) do
    for word in line:gmatch("%w+") do
      table.insert(rows, word)
    end
  end

  m_file:close()
  return rows
end

function file.exists(name)
  local f=io.open(name,"r")
  if f~=nil then
    io.close(f)
    return true
  else
    return false
  end
end

return file