local function unmanaged_stuff()
  vim.cmd [[
    function! AnimateWindowDelta(duration, width_delta, height_delta) abort
      " Store state so that we can access it in the step function
      let animation = {
        \ 'width_initial': winwidth(0), 'height_initial': winheight(0),
        \ 'width_delta': a:width_delta, 'height_delta': a:height_delta,
        \ 'duration': a:duration, 'start_time': str2float(reltimestr(reltime())) * 1000.0,
        \}

      " The main animation step function that is called on each interval
      function! animation.step(timer)
        " Calculate the time elapsed, appropriate width/height for this amount of elapsed time
        let elapsed = min([float2nr(self.duration), float2nr(str2float(reltimestr(reltime())) * 1000.0 - self.start_time)])
        let width = float2nr(-self.width_delta * elapsed / self.duration * ( elapsed / self.duration- 2) + self.width_initial)
        let height = float2nr(-self.height_delta * elapsed / self.duration * ( elapsed / self.duration- 2) + self.height_initial)

        " Perform the animation if the widths/heights are different
        if width != winwidth(0)
            execute 'vertical resize ' . string(width)
        endif
        if height != winheight(0)
            execute 'resize ' . string(height)
        endif

        " If the time elapsed is less than the animation duration then schedule anoanother step, otherwise remove the timer id
        if elapsed < self.duration
            call timer_start(5, self.step)
        endif
      endfunction

      " Run the first step
      call animation.step(0)
    endfunction

    function! Animate(percent, duration)
      let l:availabel_height = &lines - &cmdheight - (&laststatus == 0 ? 0 : 1) - (&showtabline == 0 ? 0 : 1)
      if winwidth('%')==&columns || winwidth('%')==winwidth(winnr('$') - 1)
          call AnimateWindowDelta(a:duration, 0, float2nr(l:availabel_height * a:percent - winheight(0)))
      elseif winheight('%')==l:availabel_height || winheight('%')==winheight(winnr('$') - 1)
          call AnimateWindowDelta(a:duration, float2nr(&columns * a:percent - winwidth(0)), 0)
      else
          echom "WTF!"
      endif
    endfunction
    "autocmd WinNew * call Animate(0.4, 300.0)

    function! ProjectLuaExists()
      if filereadable("project.lua")
        :source project.lua
     endif
    endfunction

    function! LoadSession()
        let lists_of_dirs = split(getcwd(), '/')
        let lenght_of_dirs = len(lists_of_dirs)
        let parent_directory = get(lists_of_dirs, lenght_of_dirs - 2)
        let directory = get(lists_of_dirs, lenght_of_dirs - 1)
        let final = parent_directory . "_" . directory

        let b:sessiondir = $HOME . "/.config/nvim/sessions/"
        let b:sessionfile = b:sessiondir . final . ".vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
            exe 'source .nvimrc'
            if filereadable(".nvimrc")
            endif
        else
            echo "No session loaded."
        endif
    endfunction

    function! SaveSession(overwrite)
        let lists_of_dirs = split(getcwd(), '/')
        let lenght_of_dirs = len(lists_of_dirs)
        let parent_directory = get(lists_of_dirs, lenght_of_dirs - 2)
        let directory = get(lists_of_dirs, lenght_of_dirs - 1)
        let final = parent_directory . "_" . directory

        let b:sessiondir = $HOME . "/.config/nvim/sessions/"
        if (filewritable(b:sessiondir) != 2)
            exe 'silent !mkdir -p ' b:sessiondir
            redraw!
        endif
        let b:filename = b:sessiondir . final . '.vim'
        if a:overwrite == 0 && !empty(glob(b:filename))
            return
        endif
        exe "mksession! " . b:filename
    endfunction

    function! FTerminal(...) " a:1 >> command
        exec("terminal")
        if exists("a:1")
            let l:tid = b:terminal_job_id
            "call jobsend(l:tid, a:1)
            call chansend(l:tid, [a:1, "\n", ""])
        endif
    endfunction

    function! HTerminal(...) " a:1 >> speed, a:2 >> width | height, a:3 >> command
        new term://bash
        wincmd J | resize 1
        call Animate(a:1, a:2)
        if exists("a:3")
            let l:tid = b:terminal_job_id
            "call jobsend(l:tid, a:3)
            " chansend crashes, see: 16040, whenever it fixed switch to chansend. >> update: seems it's working.
            call chansend(l:tid, [a:3, "\n", ""])
        endif
    endfunction

    function! VTerminal(...) " a:1 >> speed, a:2 >> width | height, a:3 >> command
        vnew term://bash
        vertical resize 10
        call Animate(a:1, a:2)
        if exists("a:3")
            let l:tid = b:terminal_job_id
            " call jobsend(l:tid, a:3)
            call chansend(l:tid, [a:3, "\n", ""])
        endif
    endfunction

    nnoremap <silent> <C-t> :call HTerminal(0.4, 300.0)<CR>
    nnoremap <silent> <A-t> :call FTerminal()<CR>
    " nnoremap <silent> <C-A-t> :call VTerminal(0.5, 300.0)<CR>
  ]]
end

--vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
--  command = "lua require'nvim-lightbulb'.update_lightbulb()",
--})

vim.api.nvim_create_autocmd("TermClose", {
  command = ":call feedkeys('i')",
})

vim.api.nvim_create_autocmd("TermOpen", {
  command = "set bufhidden=hide",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.txt",
  command = ":only",
})

--vim.api.nvim_create_autocmd("VimEnter", {
--  command = ":call ProjectLuaExists()",
--})

--vim.api.nvim_create_autocmd("VimEnter", {
--  command = ":lua require('user.wrapper.statusline.sections').init()",
--})

vim.api.nvim_create_autocmd("TermOpen", {
  command = ":setlocal nonumber | startinsert",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = ".envrc",
  command = ":set filetype=sh",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.md",
  command = ":set filetype=md",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.srt",
  command = ":set filetype=srt",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.vala",
  command = ":set filetype=vala",
})

--autocmd FileType qf 12wincmd_
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  command = "12wincmd_",
})

local function set_theme()
  vim.opt.termguicolors = true
  vim.opt.background='dark'

  require('vscode').setup({
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
      vscBack = '#3d3d3d',
      vscLineNumber = "#a3a3a3",
      vscSelection = "#7d7566",
    },
  })
  require('vscode').load('dark')
end

local vim = {}

function vim.init()
  set_theme()
  unmanaged_stuff()
end

function vim.variables()
  require("user.ui.popup").show_internal("let v:")
end

function vim.global_variables()
  require("user.ui.popup").show_internal("let g:")
end

function vim.differ_options()
  require("user.ui.popup").show_internal("set")
end

function vim.all_options()
  require("user.ui.popup").show_internal("set all")
end

return vim
