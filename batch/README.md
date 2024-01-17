# First Steps
- add __fzf__ and __wmenu__ in this directory to your environment variables.
- also add these env:
  - FZF_DEFAULT_OPTS : --layout=reverse --border --cycle
  - FZF_DEFAULT_COMMAND: rg --files --no-ignore --hidden --follow --glob "!.git/*"
  - FZF_CTRL_U_COMMAND: ls -ltrah --color=auto
  - FZF_COMPLETION_AUTO_COMMON_PREFIX: true

# TODO
- [] create menu of applications using fzf and batch scripts.
- [] create functions/aliases for cmd.
- [] create batch script to set/unsert environtment variables.
- [] create batch script to put application in startup: `C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`.
