local strings =  {}

function strings.isempty(s)
  return s == nil or s == ""
end

function strings.split(input, delimiter)
  local result = {};
  for match in (input..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
  end
  return result;
end

function strings.trim(input)
   return input:match'^()%s*$' and '' or input:match'^%s*(.*%S)'
end

function strings.to_table(input)
  local table = {}
  for counter = 1, #input do
    table[counter] = input:sub(counter, counter)
  end
  return table
end

return strings