# Development
- git
- neovim 
- openssh
- fd 
- grep 
- llvm 
- scc
- ripgrep
- ugrep 
- zeal
- doxygen
- cppcheck 
- cscope
- delta
- diffutils 
- gdb 
- dependencies
- regdllview
- drmemory
- OpenCppCoverage
- FlawFinder: https://dwheeler.com/flawfinder/
- VCG: https://github.com/nccgroup/VCG
- ApiMonitor: http://www.rohitab.com/apimonitor
- WinSpy: https://github.com/strobejb/winspy
- EdoC++: https://edoc.sourceforge.net/index.html
- procexp: https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer
- procmon: https://learn.microsoft.com/en-us/sysinternals/downloads/procmon
- windbg: https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/
  - Other usefull tools included: https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/extra-tools
- windows ADK: https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
- WDK(Windows Driver Kit): https://learn.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk
- Build Tools for Visual Studio 2022(https://visualstudio.microsoft.com/downloads/)
  
  It will install these software on your machine:
  - Windows Software Development Kit
  - Microsoft Visual C++ 2015-2022 Redistributable
  - Microsoft Visual Studio Installer

  And through Developer Command prompt for Visual Studio 2022, you can access to:
  - cl.exe
  - dumpbin

## Important directories of Visual Studio Build Tools
- packages directory: `C:\ProgramData\Microsoft\VisualStudio\Packages`
- shared components, tools, sdk: `C:\Program Files (x86)\Microsoft Visual Studio\Shared`
- build tools: `C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools`

## Generate ssh keys
- generate a rsa key:
  `ssh-keygen -t rsa -b 2048 -C "email@example.com"`

It'll create two files: __id_rsa__ and __id_rsa.pub__.
Open __id_rsa.pub__ and copy it's content into your git account in ssh part.

## Resources
https://github.com/flutter/flutter/issues/77638
https://devtalk.blender.org/t/error-after-debug-vsdevcmd-bat-calling-ext/25990
https://www.reddit.com/r/cpp_questions/comments/xydqmj/can_i_work_on_a_desktop_application_using_the/
https://copyprogramming.com/howto/compiling-a-win32-gui-app-without-a-console-using-mingw-and-eclipse
https://stackoverflow.com/questions/41914013/how-can-i-make-a-win32-app-with-no-dependency-on-the-msvc-dll
