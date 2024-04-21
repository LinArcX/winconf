--[[  
Neovim is part of your IDE. but what's exactly a IDE? It is not just some separated tasks? including:
- search for files: C-f (:lua require('telescope.builtin').find_files()<cr>) --> fd under the hood
- search for keywords: C-g (:lua require'telescope.builtin'.live_grep()<CR>) --> rg under the hood
- search&replace in one file: `:%s/foo/bar/gc`
- search&replace in whole directory file: ambr <keyword> <replacement> <path>
- create/rename/delete files/dirs: lunch terminal and use lf
- debugging: gdb from another terminal. (nvim-gdb, gdv, seergdb, DAP)

- [DONE] organize m_whichkey file.
- [] better git diff tool.
- [] get rid of all vim scripts by converting them to lua.
- [] show old files only related to current directory
-    [] make c-o works only for current directory. C-S-o for global come back.
- [] create a telescope plugins to show runtimepath
- [] create a telescope plugin to show list of path in runtimepath.
- [] modes in neovim(like emacs)
--]]

require('user.settings')
require('user.plugin_manager')
require('user.wrapper.vim').init()
require('user.wrapper.treesitter')
require('user.plugins.m_gitsigns')
require('user.plugins.m_whichkey')

require('user.plugins.m_lsp')
require('user.plugins.m_goto_preview')
require('user.plugins.m_lsp_signature')

vim.cmd([[highlight TabLineFill guibg=#544a5c guifg=#e3e3da]]) --8b4513 806c58 785a3c 94704b 9986b3 ffffff f5f5f2 64547a  6c567d