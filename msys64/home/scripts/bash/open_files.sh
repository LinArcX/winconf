  mime_type=
  if [[ -n "$2" ]]; then
    mime_type=$2
  else
    mime_type=$(file -b --mime-type "$1")
  fi

  case "$mime_type" in
    "inode/directory")
      cd $1 ;;
    "inode/symlink")
      mime_type_link=$(file -b --mime-type $(readlink -f "$1"))
      $HOME/scripts/bash/open_files.sh "$1" "$mime_type_link"
      ;;
    "text/plain")
      $EDITOR "$1" ;;
    "text/english")
      $EDITOR "$1" ;;
    "text/x-makefile")
      $EDITOR "$1" ;;
    "text/x-c")
      $EDITOR "$1" ;;
    "text/x-c++")
      $EDITOR "$1" ;;
    "text/x-c++hdr")
      $EDITOR "$1" ;;
    "text/x-c++src")
      $EDITOR "$1" ;;
    "text/x-chdr")
      $EDITOR "$1" ;;
    "text/x-csrc")
      $EDITOR "$1" ;;
    "text/x-lua")
      $EDITOR "$1" ;;
    "application/javascript")
      $EDITOR "$1" ;;
    "text/x-java")
      $EDITOR "$1" ;;
    "text/x-moc")
      $EDITOR "$1" ;;
    "text/x-pascal")
      $EDITOR "$1" ;;
    "text/x-tcl")
      $EDITOR "$1" ;;
    "text/x-tex")
      $EDITOR "$1" ;;
    "text/x-shellscript")
      $EDITOR "$1" ;;
    "application/x-shellscript")
      $EDITOR "$1" ;;
    "application/x-subrip")
      $EDITOR "$1" ;;
    "text/troff")
      $EDITOR "$1" ;;
    "text/mathml")
      $EDITOR "$1" ;;
    "x-scheme-handler/about")
      $EDITOR "$1" ;;
    "x-scheme-handler/unknown")
      $EDITOR "$1" ;;
    "application/json")
      $EDITOR "$1" ;;
    "application/pdf")
      $PDFVIEWER "$1" ;;
    "application/epub+zip")
      $EPUBVIEWER "$1" ;;
    "image/bmp")
      $IMAGEVIEWER "$1" ;;
    "image/gif")
      $IMAGEVIEWER "$1" ;;
    "image/jpeg")
      $IMAGEVIEWER "$1" ;;
    "image/jpg")
      $IMAGEVIEWER "$1" ;;
    "image/png")
      $IMAGEVIEWER "$1" ;;
    "image/x-png")
      $IMAGEVIEWER "$1" ;;
    "image/pjpeg")
      $IMAGEVIEWER "$1" ;;
    "image/x-bmp")
      $IMAGEVIEWER "$1" ;;
    "image/tiff")
      $IMAGEVIEWER "$1" ;;
    "video/mp4")
      $VIDEOPLAYER "$1" ;;
    "video/x-avi")
      $VIDEOPLAYER "$1" ;;
    "video/avi")
      $VIDEOPLAYER "$1" ;;
    "video/x-flic")
      $VIDEOPLAYER "$1" ;;
    "video/fli")
      $VIDEOPLAYER "$1" ;;
    "video/flv")
      $VIDEOPLAYER "$1" ;;
    "video/x-theora")
      $VIDEOPLAYER "$1" ;;
    "video/x-matroska")
      $VIDEOPLAYER "$1" ;;
    "video/mkv")
      $VIDEOPLAYER "$1" ;;
    "video/x-flv")
      $VIDEOPLAYER "$1" ;;
    "video/x-mpeg2")
      $VIDEOPLAYER "$1" ;;
    "video/x-mpeg3")
      $VIDEOPLAYER "$1" ;;
    "video/mpeg")
      $VIDEOPLAYER "$1" ;;
    "video/divx")
      $VIDEOPLAYER "$1" ;;
    "video/vnd.divx")
      $VIDEOPLAYER "$1" ;;
    "video/msvideo")
      $VIDEOPLAYER "$1" ;;
    "video/quicktime")
      $VIDEOPLAYER "$1" ;;
    "video/ogg")
      $VIDEOPLAYER "$1" ;;
    "video/3gp")
      $VIDEOPLAYER "$1" ;;
    "video/dv")
      $VIDEOPLAYER "$1" ;;
    "audio/mp3")
      $AUDIOPLAYER "$1" ;;
    "audio/aac")
      $AUDIOPLAYER "$1" ;;
    "audio/x-aac")
      $AUDIOPLAYER "$1" ;;
    "audio/aiff")
      $AUDIOPLAYER "$1" ;;
    "audio/m4a")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg2")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg3")
      $AUDIOPLAYER "$1" ;;
    "audio/mpg")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/wav")
      $AUDIOPLAYER "$1" ;;
    "audio/wma")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/ac3")
      $AUDIOPLAYER "$1" ;;
    "text/html")
      $BROWSER "$1" ;;
    "text/x-sql")
      $DBBROWSER "$1" ;;
  esac