# Bootstrapper - v 0.1.0

write-host "Welcome to bootstrapper!"
""
write-host "USERPROFILE: $env:USERPROFILE"`n"APPDATA: $env:APPDATA"`n"LOCALAPPDATA: $env:LOCALAPPDATA"
""

# 1. Remove Pre-Installed pacakge from windows.
# 2. Install drivers.
# 3. Install chocolatey, gsudo.
# Not in chocolatey: fantasque-sans-ttf, vazir-ttf
# Recommanded: rufus, libreoffice-fresh, unzip, transmission, python2, python3
# Garbages: screencloud(in favor of built-in capability in windows 10), FiraCode
# Interesting packages: WinDivert, proxifier, Dr. Memory, JTracer

write-host -ForegroundColor DarkGreen ">>> Installing packages via choco"
gsudo choco install 7zip autohotkey unar lavfilters
gsudo choco install Far mpv musikcube okular imageglass
gsudo choco install git openssh powershell-core ripgrep llvm mingw dependencywalker sqlitebrowser
gsudo choco install neovim --pre
gsudo choco install Firefox uget

gsudo choco install visualstudio-installer visualstudio2019community visualstudio2019buildtools visualstudio2019-workload-vctools windows-sdk-10

$dest_nvim = "$env:LOCALAPPDATA\nvim"
If(!(test-path $dest_nvim))
{
    write-host -ForegroundColor DarkGreen ">>> Copying neovim configs to $dest_nvim"

    New-Item -ItemType Directory -Path $dest_nvim
    If(!(test-path $dest_nvim\plugin))
    {
        New-Item -ItemType Directory -Path $dest_nvim\plugin
    }
    If(!(test-path $dest_nvim\functions))
    {
        New-Item -ItemType Directory -Path $dest_nvim\functions
    }
    If(!(test-path $dest_nvim\autoload))
    {
        New-Item -ItemType Directory -Path $dest_nvim\autoload
    }
    If(!(test-path $dest_nvim\after))
    {
        New-Item -ItemType Directory -Path $dest_nvim\after
    }
    If(!(test-path $dest_nvim\after\ftplugin))
    {
        New-Item -ItemType Directory -Path $dest_nvim\after\ftplugin
    }
    get-childitem ".config\nvim" -recurse | where {$_.extension -eq ".vim"} | % {
        $FullPath = $_.FullName
        $PathArray = $_.FullName -split "nvim\\"
        $RealPath = $PathArray[1]
        New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\$RealPath -Target $FullPath
    }
}

$dest_mpv = "$env:LOCALAPPDATA\mpv"
If(!(test-path $dest_mpv))
{
    write-host -ForegroundColor DarkGreen ">>> Copying mpv configs to $dest_mpv"

    New-Item -ItemType Directory -Path $dest_mpv
    If(!(test-path $dest_mpv\script-opts))
    {
        New-Item -ItemType Directory -Path $dest_mpv\script-opts
    }
    If(!(test-path $dest_mpv\scripts))
    {
        New-Item -ItemType Directory -Path $dest_mpv\scripts
    }
    get-childitem ".config\mpv" -recurse | where { ($_.extension -eq ".conf") -or ($_.extension -eq ".lua") } | % {
        $FullPath = $_.FullName
        $PathArray = $_.FullName -split "mpv\\"
        $RealPath = $PathArray[1]
        New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\mpv\$RealPath -Target $FullPath
    }
}
