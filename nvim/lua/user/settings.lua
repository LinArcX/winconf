local set = vim.opt
local global = vim.g

function get_git_branch()
  local branch = vim.fn.systemlist('git branch --show-current 2>/dev/null')
  if branch and #branch > 0 then
      return ' ' .. branch[1]
  else
      return ''
  end
end

function buffer_count()
  local bufinfo = vim.fn.getbufinfo({ buflisted = 1 })
  return #bufinfo
end

vim.o.showtabline = 2
vim.o.tabline="%{v:lua.buffer_count()}  %{&modified ? '[+]' : ''} %f %{&readonly ? '[RO]' : ''} %{&paste ? '[PASTE]' : ''} %= %{v:lua.get_git_branch()}   %{getcwd()} "

global.do_filetype_lua = 1
global.filetype="on"
global.mapleader=","            -- change from \ to ,
global.maplocalleader=","

global.asyncrun_open = 6
global.session_autosave = 'no'
global.session_directory = '~/.config/nvim/sessions'
global.python3_host_prog="/bin/python3"

set.mouse='a'                   -- Mouse Integration
set.path= '**'                  -- For clever completion with the :find command
set.exrc=true
set.wrap=false
set.number=true
set.secure=true
set.undofile=true
set.cindent=false
set.swapfile=false
set.showmatch=true
set.laststatus=0
set.timeoutlen = 0
set.expandtab=true              -- When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set.autowrite=true
set.smartcase=true
set.autochdir=false             -- Don't change directory(it's important for build projects)
set.ignorecase=true
set.splitright=true
set.splitbelow=true             -- Open windows as split always in below or right
set.smartindent=true
set.foldenable=false
set.termguicolors=true
set.pastetoggle='<A-p>'         --PasteMode disable auto-indent and bracket auto-compelation and it helps you to paste code from elsewhere.
set.shiftwidth=2
set.shiftwidth=2
set.pumheight=10
set.tabstop=2
set.softtabstop=2               -- Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
set.foldlevel=2
set.foldnestmax=10
set.colorcolumn="160"
set.foldmethod='indent'
set.shell='/usr/bin/bash'
set.clipboard='unnamedplus'
set.spellfile={ "~/.config/nvim/spell/en.utf-8.add" }
set.completeopt={ "menuone", "preview" }
set.wildignore= { '*/cache/*', '*/tmp/*', '*.swp', '*.pyc', '*.pyo', '.DS_Store', 'Thumbs.db', '*.so', '*.dll', '*.exe', '*.lib', '*.pdb' }

vim.cmd [[
  set t_Co=256
  set wildmode=list:longest,full
  set wildmode=list,full
  set omnifunc=syntaxcomplete#Complete
  set cursorline

  command -bang -bar WA wa<bang>
  command -bang -bar Wa wall<bang>
  command -bang -bar Q quit<bang>
  command -bang -bar Qa qall<bang>
  command -bang -bar QA qall<bang>
  command -bang -bar -complete=file -nargs=? E edit<bang> <args>
  command -bang -bar -complete=file -nargs=? W write<bang> <args>
  command -bang -bar -complete=file -nargs=? WQ wq<bang> <args>
  command -bang -bar -complete=file -nargs=? Wq wq<bang> <args>

  hi ColorColumn ctermbg=DarkGray
  hi Search cterm=NONE ctermfg=white ctermbg=blue
  hi Visual cterm=NONE ctermfg=white ctermbg=blue
  highlight WinSeparator guibg=None

  exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

  " filetype=plugin on
  " filetype=indent off
  " filetype=indent plugin off
  " termguicolors = true
]]