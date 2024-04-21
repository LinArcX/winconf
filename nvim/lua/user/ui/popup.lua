local popup = {}

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local function show_popup(rows)
  local m_popup = Popup({
    enter = true,
    focusable = true,
    border = { style = "rounded" },
    position = { row = "20%", col = "50%" },
    size = { width = "70%", height = "40%" },
    buf_options = { modifiable = true, readonly = true },
  })

  m_popup:mount()
  m_popup:on(event.BufLeave, function() m_popup:unmount() end)
  vim.api.nvim_buf_set_lines(m_popup.bufnr, 0, 1, false, rows)
end

local function on_event(job_id, data, event)
  local has_error = false
  if event == "stderr" then
    local lines = { "" }
    local error_lines = ""
    vim.list_extend(lines, data)

    for i = 1, #lines do
      if not require('user.util.strings').isempty(lines[i]) then
        error_lines = error_lines .. "\n" .. lines[i]
        has_error = true
      end
    end
    if has_error then
      require("notify").notify(error_lines, "ERROR", { title = "ERROR", timeout = 500 })
    end
  end
  if event == "stdout" then
    show_popup(data)
  end
end

function popup.show(command)
  vim.fn.jobstart(command,
    { on_stderr = on_event,
      on_stdout = on_event,
      on_exit = on_event,
      stdout_buffered = true,
      stderr_buffered = true })
end

function popup.show_internal(command)
  local result = require("user.util.neovim").run_command_return_output_as_table(command)
  show_popup(result)
end

return popup