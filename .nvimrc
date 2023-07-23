function! UpdateProfile()
    :silent! !copy "profile.ps1" "C:\Users\saeed\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
endfunction
au BufWrite profile.ps1 call UpdateProfile()

function! UpdatePreferences()
    :silent! !copy "autohotkey\preferences.ahk" "C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\preferences.ahk"
endfunction
au BufWrite ./autohotkey/preferences.ahk call UpdatePreferences()
