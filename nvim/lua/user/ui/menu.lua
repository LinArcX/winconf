local menu =  {}

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local m_action

local function on_item_selected(item)
  if item.text == "Yes" then
    vim.fn.jobstart(m_action,
      { on_stderr = require("user.util.neovim").on_event,
        on_stdout = require("user.util.neovim").on_event,
        on_exit = require("user.util.neovim").on_event,
        stdout_buffered = true,
        stderr_buffered = true })
  end
end

function menu.show(title, items, successful_message, action)
  m_action = action
  require("user.util.neovim").set_successfull_message(successful_message)

  local new_lines = {}
  for counter, item in ipairs(items) do
    new_lines[counter] = Menu.item(item)
  end

  local m_menu = Menu({
    position = { row = "5%", col = "50%" },
    size = { width = 40, height = 2 },
    relative = "editor",
    border = {
      highlight = "MyHighlightGroup",
      style = "single",
      text = {
        top = title,
        top_align = "center",
      },
    },
    win_options = { winblend = 10, winhighlight = "Normal:Normal" },
  },
  {
    lines = new_lines,
    max_width = 20,
    keymap = {
      focus_next  = { "j", "<Down>", "<Tab>" },
      focus_prev  = { "k", "<Up>", "<S-Tab>" },
      close       = { "<Esc>", "<C-c>" },
      submit      = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      on_item_selected(item)
    end,
  })

  m_menu:mount()
  m_menu:on(event.BufLeave, m_menu.menu_props.on_close, { once = true })
end

return menu