#-----------=[ General ] =----------#
keep-open                           # keep the player open when a file's end is reached
hls-bitrate=max                     # use max quality for HLS streams
ao='alsa'
vo='gpu'
hwdec='vaapi'
#sub-font="" Roboto #Merriweather 
sub-font="Vazir"
sub-scale = 1.3
sub-scale-with-window='yes'
geometry='50%:50%'
autofit-larger='70%x70%'
save-position-on-quit
screenshot-directory = "~/Pictures/mpv"
sub-pos = 97
#secondary-sid='auto'
#sub-codepage=utf8:cp1256

#------------=[ Audio ]=------------#
audio-device=alsa/default
audio-channels=auto
audio-file-auto=fuzzy               # external audio doesn't has to match the file name exactly to autoload
audio-pitch-correction=yes          # automatically insert scaletempo when playing with higher speed
volume-max=300                      # maximum volume in %, everything above 100 results in amplification
volume=100                          # default volume, 100 = unchanged

#------------=[ Video ]=------------#
[high-quality]
profile-desc=cond:is_desktop() and get('width', math.huge) < 3840
scale=ewa_lanczossharp
cscale=ewa_lanczossoft
dscale=mitchell
scale-antiring=0
cscale-antiring=0
dither-depth=auto
correct-downscaling=yes
sigmoid-upscaling=yes
deband=yes
hwdec=no