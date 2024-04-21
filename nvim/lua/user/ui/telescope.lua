local telescope =  {}

local themes = require("telescope.themes")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")

local m_action_after_submit

function themes.vscode(opts)
  opts = opts or {}
  local theme_opts = {
    theme = "dropdown",
    results_title = false,
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      anchor = "N",
      prompt_position = "top",
      width = function(_, max_columns, _)
        return math.min(max_columns, 120)
      end,
      height = function(_, _, max_lines)
        return math.min(max_lines, 15)
      end,
    },
  }
  if opts.layout_config and opts.layout_config.prompt_position == "bottom" then
    theme_opts.borderchars = {
      prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
  end
  return vim.tbl_deep_extend("force", theme_opts, opts)
end

local function on_submited(prompt_bufnr)
  local selection = action_state.get_selected_entry()

  if string.match(selection[1], "*") then
    local updated_value = selection[1]:gsub("%*", "")
    selection[1] = updated_value
  end
  actions.close(prompt_bufnr)

  local command = m_action_after_submit .. selection[1]

  vim.fn.jobstart(command,
    { on_exit = require("user.util.neovim").on_event,
      on_stderr = require("user.util.neovim").on_event,
      on_stdout = require("user.util.neovim").on_event,
      stdout_buffered = true,
      stderr_buffered = true })
end

function telescope.show(title, action_startup, action_after_submit, successful_message)
  require("user.util.neovim").run_command_return_output_as_table(action_startup)

  m_action_after_submit = action_after_submit
  require("user.util.neovim").set_successfull_message(successful_message)

  local opts = require("telescope.themes").vscode({})
  pickers.new(opts, {
    prompt_title = title,
    finder = finders.new_table {
      results = require("user.util.neovim").run_command_return_output_as_table(action_startup),
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(on_submited)
      return true
    end,
  }):find()
end

return telescope