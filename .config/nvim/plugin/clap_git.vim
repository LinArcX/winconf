"--------------------- Helper functions ---------------------"
let IsUnderGit = system('git rev-parse --is-inside-work-tree')
function ResetStatusLine(timer)
    set statusline=
    set laststatus=2
    set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ %{expand('%:p:h')}\%#warningmsg#
    set statusline+=
    set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
    set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
    set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
endfunction

"--------------------- Add ---------------------"
function! OnGitAddExit(job_id, data, event) dict
    if a:event == "exit"
        if a:data[0] == 0
            set statusline=
            set laststatus=2
            set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ Git:\ Added\ successfuly!\%#warningmsg#
            set statusline+=
            set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
            set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
            set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
            let timer = timer_start(3000, 'ResetStatusLine')
        else
            set statusline=
            set laststatus=2
            set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ Git:\ Add\ error!\%#warningmsg#
            set statusline+=
            set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
            set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
            set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
            let timer = timer_start(3000, 'ResetStatusLine')
        endif
    endif
endfunction
function! GitAdd()
    let l:callbacks = {
                \ 'on_exit': function('OnGitAddExit'),
                \ }
    call jobstart('git add .', l:callbacks)
endfunction

"---------------------- Commit ----------------------"
function! OnGitCommitStdOut(job_id, data, event) dict
    if a:event == "stdout" && a:data[0] != ''
        call ShowTextBox("Commit", a:data)
        echom ""
    endif
endfunction

function! GitCommit()
    let l:commit_message = input('Enter commit message: ')
    let l:callbacks = {
                \ 'on_stdout': function('OnGitCommitStdOut'),
                \ }
    call jobstart('git commit -m "' .l:commit_message .'"', l:callbacks)
endfunction

"---------------------- Push ----------------------"
function! OnGitPushStdOut(job_id, data, event) dict
    if a:event == "stdout" && a:data[0] != ''
        call ShowTextBox("Push", a:data)
        let timer = timer_start(1, 'ResetStatusLine')
    endif
endfunction

function! GitPush()
    let l:callbacks = {
                \ 'on_stdout': function('OnGitPushStdOut'),
                \ }
    call jobstart('torify git push -u origin master', l:callbacks)
    set statusline=
    set laststatus=2
    set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ Pushing...\%#warningmsg#
    set statusline+=
    set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
    set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
    set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
endfunction

"---------------------- Purge ----------------------"
function! PurgeRepo()
    let l:agreement = input('Are you agree to purge the repo? (No, Yes)')
    if(l:agreement==# "Yes")
        let l:purge = 'clear; git checkout --orphan TEMP_BRANCH; git add -A; git commit -am "Initial commit"; git branch -D master; git branch -m master; git push -f origin master'
        call FTerminal(l:purge. " \n && less && exit")
    endif
endfunction

function! ChangeRemoteUrl()
    let l:new_remote = input('Enter new remote url:')
    let l:command = '!git remote set-url origin ' .l:new_remote
    call ExecCommands("Change Remote Url", l:command)
endfunction

function! CheckOutBranch()
    let l:new_branch = input('Enter branch name:')
    call FTerminal("clear; git checkout -b ".l:new_remote)
endfunction

function! OpenGitConfig()
    let l:root_path = trim(system("git rev-parse --show-toplevel"))
    execute  ':e ' . l:root_path ."/.git/config"
endfunction

" sacp--df--riu--bot--ng
if (match(IsUnderGit,"true") == 0)
    call quickui#menu#clear('&Git')
    call quickui#menu#install('&Git', [
                \ [ '&status', 'call ExecCommands("Status", "!git status")' ],
                \ [ '&add-all', 'call GitAdd()' ],
                \ [ '&commit', 'call GitCommit()' ],
                \ [ '&push', 'call GitPush()' ],
                \ [ "--", '' ],
                \ [ "co&mmits", 'call GitHistory()' ],
                \ [ "f&iles\tAlt-f", 'call GitFiles()' ],
                \ [ "--", '' ],
                \ [ '&diff-HEAD', 'call FTerminal("git diff HEAD | less && exit \n")' ],
                \ [ 'di&ff-staged', 'call FTerminal("git diff --staged | less && exit \n")' ],
                \ [ "--", '' ],
                \ [ 'show-&remote', 'call ExecCommands("Remotes", "!git remote -v")' ],
                \ [ 'show-remote-or&igin', 'call ExecCommands("Remote origin", "!git remote show origin")' ],
                \ [ 'change-remote-&url', 'call ChangeRemoteUrl()' ],
                \ [ "--", '' ],
                \ [ 'checkout-&branch', 'call CheckOutBranch()' ],
                \ [ 'show-l&ocal-branch', 'call ExecCommands("Local branchs", "!git branch")' ],
                \ [ 'show-remo&te-branch', 'call ExecCommands("Remote branchs", "!git branch -r")' ],
                \ [ "--", '' ],
                \ [ 'open-git/co&nfig', 'call OpenGitConfig()' ],
                \ [ 'purg&e', 'call PurgeRepo()' ],
                \ ], 4000)
endif

"call TerminalAction(2, l:command. " | less && exit \n")
            "\ [ '&add-all', 'call ExecCommands("Add all", "!git add .")' ],

" move a tag on a git branch to a different commit?
"git tag -fa 2.1.0
"git push origin master --tags --force

" Delete local commits from branch
" git reset --hard HEAD~1

" If you'd like to delete the commits up until a specific commit, running <git log> into the command line to find the specific commit id and then running
" git reset --hard <sha1-commit-id>

"Alternatively, if you have already pushed your changes you will need to run the following code

"git push origin HEAD --force


" Fix conflicts when you same files changed:
"1. git add and press space. git will automatically add files for you. then git rebase --continue
"2. Repeat until there is no conflict left

"git rebase -i HEAD~4
"git add srcpkgs/python3-path-and-address/template
"git rebase --continue
"git add srcpkgs/grip/template
"git rebase --continue


"The easiest way would be to find the head commit of the branch as it was immediately before the rebase started in the reflog...
"git reflog
"
"and to reset the current branch to it (with the usual caveats about being absolutely sure before reseting with the --hard option).
"Suppose the old commit was HEAD@{5} in the ref log:
"
"git reset --hard HEAD@{5}

"git log --follow -p -- path-to-file


"    set statusline=
"    "set statusline+=\ %f
"    "set statusline+=%#LineNr#
"    set statusline+=Git:\ successfuly\ added\ all\ files!


"set laststatus=2
"set statusline+=%0*\ %{ModeCurrent()}\ |
"set statusline+=%1*\%{GitBranch()}
"set statusline+=%2*\ Git:\ Pushed\ successfuly!
"set statusline+=%#warningmsg#
"set statusline+=%*
"set statusline+=%2*\ %=                                  " Space
"set statusline+=%7*
"set statusline+=%3*\ %{ReadOnly()}\ |
"set statusline+=%4*\ %{nr2char(0x1f4dd)}
"set statusline+=%1*\ %{FilePermission()}\ |
"set statusline+=%5*\ %{nr2char(0x1f47d)}
"set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline+=%1*\ %-3(%{FileSize()}%)                 " File size
"set statusline+=%1*\ %3p%%\ \ %l:\%3c\                  " Rownumber/total (%)


"set laststatus=2
"set statusline+=%0*\ %{ModeCurrent()}\ |
"set statusline+=%1*\%{GitBranch()}
"set statusline+=%#warningmsg#
"set statusline+=%*
"set statusline+=%2*\ %=                                  " Space
"set statusline+=%7*
"set statusline+=%3*\ %{ReadOnly()}\ |
"set statusline+=%4*\ %{nr2char(0x1f4dd)}
"set statusline+=%1*\ %{FilePermission()}\ |
"set statusline+=%5*\ %{nr2char(0x1f47d)}
"set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline+=%1*\ %-3(%{FileSize()}%)                 " File size
"set statusline+=%1*\ %3p%%\ \ %l:\%3c\                  " Rownumber/total (%)


"function! Commit()
"    let l:command = '!git commit -m "' .l:commit_message .'"'
"    call ExecCommands("Commit", l:command)
"endfunction


"function! OnGitPushExit(job_id, data, event) dict
"    if a:event == "exit"
"        if a:data[0] == 0
"            set statusline=
"            set laststatus=2
"            set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ Git:\ Pushed\ successfuly!\%#warningmsg#
"            set statusline+=
"            set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
"            set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
"            set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
"            let timer = timer_start(3000, 'ResetStatusLine')
"        else
"            set statusline=
"            set laststatus=2
"            set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ Git:\ Push\ error!\%#warningmsg#
"            set statusline+=
"            set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
"            set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
"            set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
"            let timer = timer_start(3000, 'ResetStatusLine')
"        endif
"    endif
"endfunction


"Q: How to modify a specified commit?
"
"You can use git rebase. For example, if you want to modify commit bbc643cd, run
"
"$ git rebase --interactive 'bbc643cd^'
"
"Please note the caret ^ at the end of the command, because you need actually to rebase back to the commit before the one you wish to modify.
"
"In the default editor, modify pick to edit in the line mentioning 'bbc643cd'.
"
"Save the file and exit: git will interpret and automatically execute the commands in the file. You will find yourself in the previous situation in which you just had created commit bbc643cd.
"
"At this point, bbc643cd is your last commit and you can easily amend it: make your changes and then commit them with the command:
"
"$ git commit --all --amend --no-edit
"
"After that, type:
"
"$ git rebase --continue
"
"to return back to the previous HEAD commit.
"
"WARNING: Note that this will change the SHA-1 of that commit as well as all children -- in other words, this rewrites the history from that point forward. You can break repos doing this if you push using the command git push --force
"https://stackoverflow.com/questions/1186535/how-to-modify-a-specified-commit
