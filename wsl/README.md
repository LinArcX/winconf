# WSL
1. Open start menu and search for: `windows features, open Turn Windows features On or Off`.
2. Find __Windows Subsystem for Linux__, click to turn it on.
3. After a restart, you could now open your windows command line and input `bash`, then hit __enter__.

    3.1. You may see something like this:

    > bash
        Windows Subsystem for Linux has no installed distributions.
        Distributions can be installed by visiting the Microsoft Store:
        https://aka.ms/wslstore

    Don't worry! you should just install a distro!(via windows store or via chocolatey.)

4. Then you need to configure your default user and password to the system. This is just for this built-in Ubuntu, not Windows
5. Install wsl2(don't use wls, it's terrible!), and other distributions like arch via chocolatey.
```
gsudo choco install wsl2 wsl-archlinux
```
