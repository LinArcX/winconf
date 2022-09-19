function! mpa#window_delta(duration, width_delta, height_delta) abort
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

function! mpa#animate(percent, duration)
    let l:availabel_height = &lines - &cmdheight - (&laststatus == 0 ? 0 : 1) - (&showtabline == 0 ? 0 : 1)
    if winwidth('%')==&columns || winwidth('%')==winwidth(winnr('$') - 1)
        call mpa#window_delta(a:duration, 0, float2nr(l:availabel_height * a:percent - winheight(0)))
    elseif winheight('%')==l:availabel_height || winheight('%')==winheight(winnr('$') - 1)
        call mpa#window_delta(a:duration, float2nr(&columns * a:percent - winwidth(0)), 0)
    else
        echom "WTF!"
    endif
endfunction
"autocmd WinNew * call mpa#animate(0.4, 300.0)
