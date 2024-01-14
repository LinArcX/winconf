# Development
## Setup git
First install openssh with scoop.

Then generate a rsa key:
`ssh-keygen -t rsa -b 2048 -C "email@example.com"`

It'll create two files: __id_rsa__ and __id_rsa.pub__.
Open __id_rsa.pub__ and copy it's content into your git account in ssh part.

https://docs.gitlab.com/ee/ssh/

## C/C++ Development without VisualStudio
First install these base packages via chocolatey:

```
visualstudio-installer
visualstudio2019community
visualstudio2019buildtools
visualstudio2019-workload-vctools
```

Above packages will install these indiviaul components on your machine:
- C++ 2019 Redistributable update
- C++ CMake tools for windows
- MSVC v142 - VS 2019 C++ x86/64 build tools(v14.27)
- C++ AddressSanitizer
- Testing tools core features - Build Tools
- C++ Build Tools core features
- Windows 10 SDK(10.0.18362.0)
- Windows Universal C Runtime
Tip: You can check them in indivual components tab in visual-studio-installer.

For Command-line development:
`windows-sdk-10.1`

Above package will install these indivisual components on your machine:
- .NET Framework 4.6.1 targeting pack
- .NET Framework 4.8 SDK

For Native-Desktop development:
`visualstudio2019-workload-nativedesktop`

Packages directory:
`C:\ProgramData\Microsoft\VisualStudio\Packages`

Shared components, tools, sdk:
`C:\Program Files (x86)\Microsoft Visual Studio\Shared`

Build Tools:
`C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools`

## Resources
https://stackoverflow.com/questions/41914013/how-can-i-make-a-win32-app-with-no-dependency-on-the-msvc-dll
https://devtalk.blender.org/t/error-after-debug-vsdevcmd-bat-calling-ext/25990
https://www.reddit.com/r/cpp_questions/comments/xydqmj/can_i_work_on_a_desktop_application_using_the/
https://copyprogramming.com/howto/compiling-a-win32-gui-app-without-a-console-using-mingw-and-eclipse
https://github.com/flutter/flutter/issues/77638
