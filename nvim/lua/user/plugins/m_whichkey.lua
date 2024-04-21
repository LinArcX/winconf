local wk = require("which-key")

-- remapping
vim.keymap.set('v', ':', ';')
vim.keymap.set({'n', 'v'}, ';', ':')

-- <FN> keys
vim.keymap.set('n', '<F1>', ':lua require(\'telescope.builtin\').help_tags()<CR>', { silent=true })
vim.keymap.set('n', '<F2>', ':lua JumpToCorrespondingFile()<CR>', { silent = true })
vim.keymap.set('i', '<F2>', '<C-o>:lua JumpToCorrespondingFile()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F3>', ':set hlsearch!<CR>', { silent=true })
vim.keymap.set('n', '<F12>', ':lua vim.lsp.buf.definition()<CR>', { silent=true })

-- general
vim.keymap.set('n', '<C-a>', 'GVgg', { silent=true })
vim.keymap.set('i', '<C-v>', '<C-O>p', { silent=true })                       -- Paste in insert-mode.
vim.keymap.set('n', '<A-o>', ':e . <Enter>', { silent=true })                 -- Paste in insert-mode.
vim.keymap.set('n', '<C-c>', ':lua require(\'user.comments\').toggle()<CR>', { silent=true })
vim.keymap.set('v', '<C-c>', ':lua require(\'user.comments\').toggle()<CR>', { silent=true })

vim.keymap.set('n', '<S-t>', 'vat', {})
vim.keymap.set('n', '<S-T>', 'vit', {})
vim.keymap.set('n', '<S-{>', 'vi{', {})
vim.keymap.set('n', '<S-()>', 'vi(', {})
vim.keymap.set('n', '<S-[>', 'vi[', {})
vim.keymap.set('n', '<S-<>>', 'vi<', {})

-- buffers
vim.keymap.set('n', '<C-s>', ':w <Enter>', { silent = true })
vim.keymap.set('n', '<C-A-s>', ':wa <Enter>', { silent = true })
vim.keymap.set('i', '<C-s>', '<C-O>:w <CR>', { silent = true })
vim.keymap.set('i', '<C-A-s>', '<C-O>:wa <CR>', { silent = true })
vim.keymap.set('n', '<A-q>', ':bw<CR>', {noremap = true, silent=true})
vim.keymap.set('n', '<C-q>', ':qa<CR>', { silent=true })

-- movement
vim.keymap.set('n', '<A-Up>', ':wincmd k<CR>', { silent=true })
vim.keymap.set('n', '<A-Down>', ':wincmd j<CR>', { silent=true })
vim.keymap.set('n', '<A-Right>', ':wincmd l<CR>', { silent=true })
vim.keymap.set('n', '<A-Left>', ':wincmd h<CR>', { silent=true })
vim.keymap.set('n', '<C-Left>', ':bprevious<CR>', { silent=true })
vim.keymap.set('n', '<C-Right>', ':bnext<CR>', { silent=true })
vim.keymap.set('n', '<C-n>', ':cnext<CR>')
vim.keymap.set('n', '<C-p>', ':cprevious<CR>')

vim.keymap.set('n', '<C-A-up>', 'yyP', { silent=true })                       -- Duplicate line: UP
vim.keymap.set('n', '<C-A-down>', 'yyp', { silent=true })                     -- Duplicate line: DOWN
vim.keymap.set('v', '<C-left>', 'xhPgvhoho', {noremap = false })              -- Move word to left
vim.keymap.set('v', '<C-right>', 'xpgvlolo', {noremap = false })              -- Move word to right
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')                                 -- Move line to up
vim.keymap.set('n', '<C-up>', 'ddkP', { silent=true })                        -- Move line to up
vim.keymap.set('n', '<C-down>', 'ddp', { silent=true })                       -- Move line to down
vim.keymap.set('n', '<S-k>', ':lua vim.lsp.buf.hover()<CR>', { silent=true })           

-- find
vim.keymap.set('n', '<C-f>', ':lua require(\'telescope.builtin\').git_files()<CR>', { silent=true })
vim.keymap.set('n', '<A-f>', ':Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍  <CR>', { silent=true })

-- grep
vim.keymap.set('n', '<C-g>', ':lua require\'telescope.builtin\'.live_grep()<CR>', { silent=true })
vim.keymap.set('n', '<A-g>', ':lua require\'telescope.builtin\'.live_grep{ default_text = vim.fn.expand("<cword>") }<CR>', { silent=true })

wk.register({
  l = {
    name = "lsp",
    d = { ":lua vim.lsp.buf.declaration()<CR>", "declaration" },
    f = { ":lua require('telescope.builtin').lsp_type_definitions()<CR>", "type definition" },
    --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    h = { ":lua vim.lsp.buf.hover()<CR>", "hover" },
    i = { ":lua require('telescope.builtin').lsp_implementations()<CR>", "implementation" },
    -- i = { ":lua vim.lsp.buf.implementation()<CR>", "implementation" },
    r = { ":lua require('telescope.builtin').lsp_references()<CR>", "refrences" },
    --g = { ":lua vim.lsp.buf.signature_help()<CR>", "signature help" },
    --vim.keymap.set({ 'n' }, '<C-k>', function() require('lsp_signature').toggle_float_win() end, { silent = true, noremap = true, desc = 'toggle signature' })
    --buf_set_keymap('n', 'gi', '<cmd>l', opts)
    --buf_set_keymap('n', 'gD', '<cmd>', opts)

    a = {
      name = "actions",
      r = { ":lua require('telescope.builtin').lsp_range_code_actions()<CR>", "range code actions" },
      n = { ":lua require('telescope.builtin').lsp_code_actions()<CR>", "normal code action" },
    },
    g = {
      name = "diagnostics",
      d = { "Telescope diagnostics bufnr=0<CR>", "document diagnostics" },
      w = { ":lua require('telescope.builtin').diagnostics()<CR>", "workspace diagnostics" },
      p = { "lua vim.lsp.diagnostic.goto_prev()<CR>", "diagnostic(goto prev)" },
      n = { ":lua vim.lsp.diagnostic.goto_next()<CR>", "diagnostics(goto next)" },
      l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "show line diagnostics" },
      s = { ":lua vim.lsp.diagnostic.set_loclist()<CR>", "set loclist" },
    },
    p = {
      name = "preview",
      d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "preview definition" },
      t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "preview type definition" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "preview implementation" },
      r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "preview refrence" },
      c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "close preview" },
    },
    s = {
      name = "symbols",
      d = { ":lua require('telescope.builtin').lsp_document_symbols()<CR>", "document symbols" },
      w = { ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "workspace symbols" },
      y = { ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "dynamic workspace symbols" },
    },
  },
}, { prefix = "<leader>" })

wk.register({
  ["<leader>g"] = { name = "+git" },
  ["<leader>gs"] = { ":Gitsigns toggle_signs<CR>", "gs.toggle signs" },
  --   { "gs.toggle numhl", ":Gitsigns toggle_numhl" },
  --   { "gs.preview hunk", ":Gitsigns preview_hunk" },
  --   { "gs.previous hunk", ":Gitsigns prev_hunk" },
  --   { "gs.next hunk", ":Gitsigns next_hunk" },
  --   { "gs.diff this", ":Gitsigns diffthis" },
  --   { "gs.toggle current line blame", ":Gitsigns toggle_current_line_blame" },
  --   { "diff staged", ":call FTerminal(\"git diff --staged | less && exit \n\")" },
  --   { "diff head", ":call FTerminal(\"git diff HEAD | less && exit \n\")" },
  --   { "set remote url", ":lua require('user.wrapper.git').remote.set()" },
  --   { "add remote url", ":lua require('user.wrapper.git').remote.add()" },
  --   { "origin", ":lua require('user.wrapper.git').remote.origin()" },
  --   { ".git/config", ":lua require('user.wrapper.git').open_git_config()" },
  --   { "commits", ":lua require('telescope.builtin').git_commits()" },
  --   { "purge", ":lua require('user.wrapper.git').purge()" },
  --   { "stash", ":lua require('telescope.builtin').git_stash()" },
  --   { "remotes", ":lua require('user.wrapper.git').remote.list()" },
  --   { "remote branches", ":lua require('user.wrapper.git').branch.show_remote()" },
  --   { "local branches", ":lua require('user.wrapper.git').branch.show_local()" },
  --   { "checkout to new branch", ":lua require('user.wrapper.git').branch.checkout_to_new_branch()" },
  --   { "checkout", ":lua require('user.wrapper.git').branch.checkout()" },
  --   { "push", ":lua require('user.wrapper.git').push()" },
  --   { "commit", ":lua require('user.wrapper.git').commit()" },
  --   { "add all", ":lua require('user.wrapper.git').add()" },
  --   { "status", ":lua require('telescope.builtin').git_status()" },
})

wk.register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>fb"] = { ":lua require\'telescope.builtin\'.buffers()<CR>", "Buffers" },
  ["<leader>fca"] = { ":bufdo bwipeout<CR>", "Close All Buffers" },
  ["<leader>fco"] = { ":w | %bd | e# | bd#<CR>", "Close Others" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  ["<leader>fs"] = { ":vimgrep <cword> %<CR>", "Search Pattern In File" },
  --   { "save session", ':call SaveSession(1)' },
  --   { "load session", ':call LoadSession()' },
  --   { "projects", ':Telescope project', 1 },
})

wk.register({
  ["<leader>v"] = { name = "+vim" },
  ["<leader>vws"] = { ":set syntax=whitespace<CR>", "Show WhiteSpace/Tabs" },
  ["<leader>vwh"] = { ":set syntax=<CR>", "Hide WhiteSpace/Tabs" },
  ["<leader>vh"] = { ":checkhealth<CR>", "Check Health" },
  ["<leader>vj"] = { ":lua require(\'telescope.builtin\').jumplist()<CR>", "Jump List" },
  ["<leader>vk"] = { ":lua require('telescope.builtin').keymaps()<CR>", "Keymaps" },
  ["<leader>vcc"] = { ":lua require('telescope.builtin').commands()<CR>", "Commands" },
  ["<leader>vcg"] = { ":Telescope changes<CR>", "Changes" },
  ["<leader>vch"] = { ":lua require('telescope.builtin').command_history()<CR>", "Command History" },
  ["<leader>vcs"] = { ":lua require('telescope.builtin').colorscheme()<CR>", "Color Schemes" },
  ["<leader>vrg"] = { ":lua require(\'telescope.builtin\').registers()<CR>", "Registers" },
  ["<leader>vrl"] = { ":source $MYVIMRC<CR>", "Reload init.lua" },
  ["<leader>vrn"] = { ":set relativenumber!<CR>", "Relative Number" },
  ["<leader>vp"] = { ":set paste!<CR>", "Paste Mode" },
  ["<leader>vs"] = { ":Telescope scriptnames<CR>", "Script Names" },
  --["<leader>vvl"] = { ":lua require('user.wrapper.vim').variables()<CR>", "Variables" },
  --["<leader>vvg"] = { ":lua require('user.wrapper.vim').global_variables()<CR>", "Global Variables" },
  --["<leader>vod"] = { ":lua require('user.wrapper.vim').differ_options()<CR>", "Differ Options" },
  --["<leader>voa"] = { ":lua require('user.wrapper.vim').all_options()<CR>", "All Options" },
  ["<leader>vov"] = { ":lua require('telescope.builtin').vim_options()<CR>", "Vim Options" },
  ["<leader>vta"] = { ":let &runtimepath.=','.escape(expand('%:p:h'), '\\,')<CR>", "Add PWD to RTP" },
  ["<leader>vts"] = { ":set rtp?<CR>", "Show RTP" },
  ["<leader>vur"] = { ":set cursorline!<CR>", "Row Cursor" },
  ["<leader>vuc"] = { ":set cursorcolumn!<CR>", "Column Cursor" },
})

wk.register({
  ["<leader>q"] = { name = "+quickfix" },
  ["<leader>qf"] = { ":cfirst<CR>", "first" },
  ["<leader>ql"] = { ":clast<CR>", "last" },
  ["<leader>qp"] = { ":cprevious<CR>", "previous error" },
  ["<leader>qn"] = { ":cnext<CR>", "next error" },
  ["<leader>qo"] = { ":copen<CR>", "open quickfix" },
})

wk.register({
  ["<leader>t"] = { name = "+test" },
  ["<leader>tn"] = { ":GTestNext<CR>", "next" },
  ["<leader>tp"] = { ":GTestPrev<CR>", "prev" },
  ["<leader>tj"] = { ":GTestJump<CR>", "jump to test" },
  ["<leader>tt"] = { ":GTestToggleEnabled<CR>", "toggle enabled" },
  ["<leader>tr"] = { ":GTestRun<CR>", "run" },
  ["<leader>tu"] = { ":GTestRunUnderCursor<CR>", "run under cursor" },
})

wk.register({
  ["<leader>s"] = { name = "+spell" },
  ["<leader>sc"] = { ":set spell!<CR>", "spell checker" },
  ["<leader>sp"] = { ":execute 'normal [s'<CR>", "previous word" },
  ["<leader>sn"] = { ":execute 'normal ]s'<CR>", "next word" },
  ["<leader>ssn"] = { ":execute 'normal z='<CR>", "suggestion list(default)" },
  ["<leader>ssi"] = { ":startinsert<CR>", "suggestion list(insert_mode)" },
  ["<leader>sa"] = { ":execute 'normal zg'<CR>", "<cword> >> spell_checker(zg)" },
  ["<leader>sr"] = { ":execute 'normal zw'<CR>", "<cword> << spell_checker(zw)" },
})

wk.register({
  ["<leader>p"] = { name = "+plugins" },
  ["<leader>pc"] = { ":PackerClean<CR>", "Packer Clean" },
  ["<leader>ps"] = { ":PackerSync<CR>", "Packer Sync" },
  ["<leader>pt"] = { ":PackerStatus<CR>", "Packer Status" },
  ["<leader>pu"] = { ":PackerUpdate<CR>", "Packer Update" },
  ["<leader>pi"] = { ":PackerInstall<CR>", "Packer Install" },
})

wk.register({
  ["<leader>o"] = { name = "+other" },
  ["<leader>oc"] = { ":lua CurrentWordToFrenchAudio()<cr>", "current word to french audio" },
  ["<leader>oe"] = { ":lua ExtractedTextToFrenchAudio()<cr>", "extracted text to french audio" },
  ["<leader>oi"] = { ":lua require('user.wrapper.treesitter').install()<CR>", "install language(treesitter)" },
  ["<leader>ol"] = { ":!scc .<CR>", "Lines Of Code" },
  ["<leader>or"] = { ":lua ShowTranslation()<cr>", "show translation" },
  ["<leader>ov"] = { ":Telescope env<CR>", "env" },
  ["<leader>os"] = { ":set noet|retab!<CR>", "space to tab" },
  ["<leader>ot"] = { ":set et|retab<CR>", "tab to space" },
})

wk.register({
  ["<leader>h"] = { name = "+help" },
  ["<leader>hc"] = { ":help index<CR>", "Cheat Sheet" },
  ["<leader>hh"] = { ":lua require(\'telescope.builtin\').search_history()<CR>", "Search History" },
  ["<leader>ht"] = { ":help tips<CR>", "Tips" },
  ["<leader>hq"] = { ":help quickref<CR>", "Quick Refrence" },
  ["<leader>hr"] = { ":helptags ALL<CR>", "Regenarate Help Tags" },
  ["<leader>hs"] = { ":help summary<CR>", "Summary" },
  ["<leader>ht"] = { ":help tutor<CR>", "Tutorial" },
})

function ShowTranslation()
  local extracted_text = vim.fn.substitute(vim.fn.substitute(vim.fn.getline('.'), '-\\s*\\([^()]*\\).*', '\\1', ''), '[!?]', '', 'g')
  local command = 'trans ' .. vim.fn.shellescape(extracted_text) .. " | sed -E 's/\\x1B\\[[0-9;]*[a-zA-Z]//g'"
  local output = vim.fn.system(command)
  vim.api.nvim_out_write(output)
end

function CurrentWordToFrenchAudio()
  local extracted_text = vim.fn.substitute(vim.fn.substitute(vim.fn.getline('.'), '-\\s*\\([^()]*\\).*', '\\1', ''), '[!?]', '', 'g')
  vim.fn.execute('silent !trans -speak -player mpg123 ' .. vim.fn.shellescape(vim.fn.expand('<cword>')) .. ' -s fr >/dev/null 2>&1')
end

function ExtractedTextToFrenchAudio()
  local extracted_text = vim.fn.substitute(vim.fn.substitute(vim.fn.getline('.'), '-\\s*\\([^()]*\\).*', '\\1', ''), '[!?]', '', 'g')
  vim.fn.execute('silent !trans ' .. vim.fn.shellescape(extracted_text) .. ' -speak -player mpg123 -s fr >/dev/null 2>&1')
end

function PrintError(msg)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.cmd("echohl ErrorMsg")
  vim.cmd("echomsg " .. vim.fn.escape(msg, '"\\'))
  vim.cmd("echohl None")
end

function JumpToCorrespondingFile()
  local fe = vim.fn.expand("%:e")
  if fe == "h" then
    if vim.fn.filereadable(vim.fn.expand("%<.cpp")) == 1 then
      print(".cpp extension")
      vim.cmd(":e %<.cpp")
    else
      print(".c extension")
      vim.cmd(":e %<.c")
    end
  else
    vim.cmd(":e %<.h")
  end

  --local extensions = { c = "h", h = "c", cpp = "hpp", hpp = "cpp" }
  --if extensions[fe] then
  --  vim.cmd(":tag " .. vim.fn.expand("%:t:r") .. "." .. extensions[fe])
  --else
  --  PrintError(">>> Corresponding extension for '" .. fe .. "' is not specified")
  --end
end

--function Test()
--  require'fzf-lua'.fzf_exec("ls", {
--    actions = {
--      ['enter'] = {
--        fn = function(selected)
--          print("exec:", selected[1])
--          --vim.cmd("echomsg " .. selected[1])
--        end,
--        exec_silent = true,
--      }
--    }
--  })
--
--  --require'fzf-lua'.fzf_exec("ls", {
--  --  fn_transform = function(x)
--  --      vim.cmd("echomsg " .. x)
--  --  end
--  --})
--end

vim.cmd [[
  inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-[> <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>:bd!<CR>

  function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
    else
            return "\<c-p>"
    endif
  endfunction
  inoremap <expr> <tab> InsertTabWrapper()
  inoremap <s-tab> <c-n>
]]

--wk.register({
--  ["<leader>d"] = { name = "+debug" },
--  ["<leader>dg"] = { "<cmd>GdbStart<cr>", "Start gdb" },
--  --vim.keymap.set('n', '<F4>', ':lua require\'dap\'.repl.open(); vim.cmd("wincmd w\\|resize 12\\|wincmd p")<CR>', { silent=true })
--  --vim.keymap.set('n', '<F10>', ':lua require\'dap\'.step_over()<CR>', { silent=true })
--  --vim.keymap.set('n', '<A-c>', ':lua require("user.plugins.m_dap").current_scopes_floating()<CR>', { silent=true })
--  --vim.keymap.set('n', '<A-v>', ':lua require("user.plugins.m_dap").current_value_floating()<CR>', { silent=true })
--  --vim.keymap.set('n', '<A-b>', ':lua require\'dap\'.toggle_breakpoint()<CR>', { silent=true })
--  --  { "pause", ":lua require'dap'.pause()" },
--  --  { "up", ":lua require'dap'.up()" },
--  --  { "down", ":lua require'dap'.down()" },
--  --  { "step back", ":lua require'dap'.step_back()" },
--  --  { "step out", ":lua require'dap'.step_out()" },
--  --  { "commands", ":lua require'telescope'.extensions.dap.commands{}" },
--  --  { "configurations", ":lua require'telescope'.extensions.dap.configurations{}" },
--  --  { "run to cursor", ":lua require'dap'.run_to_cursor()" },
--  --  { "clear breakpoints", ":lua require('dap.breakpoints').clear()" },
--  --  { "breakpoints", ":lua require'telescope'.extensions.dap.list_breakpoints{}" },
--  --  { "frames", ":lua require('user.plugins.m_dap').current_frames()" },
--  --  { "close", ":lua require'dap'.close(); require'dap'.repl.close()" },
--  --  { "repl", ":lua require'dap'.repl.open(); vim.cmd(\"wincmd w|resize 12|wincmd p\")" },
--  --  { "current scopes vertical", ":lua require('user.plugins.m_dap').current_scopes(); vim.cmd(\"wincmd w|vertical resize 40\")" },
--  --  { "current value (A-v)", ":lua require('user.plugins.m_dap').current_value_floating()" },
--  --  { "current scopes (A-c)", ":lua require('user.plugins.m_dap').current_scopes_floating()" },
--  --  { "step into (F11)", ":lua require'dap'.step_into()" },
--  --  { "step over (F10)", ":lua require'dap'.step_over()" },
--  --  { "continue (F5)", ":lua require'dap'.continue()" },
--  --  { "toggle breakpoint (A-b)", ":lua require'dap'.toggle_breakpoint()" },
--})