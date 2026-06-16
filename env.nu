# ========================================================================== #
#  Bases                                                                     #
# ========================================================================== #
$env.XDG_CONFIG_HOME           = ($env.HOME       | path join ".config")
$env.XDG_CACHE_HOME            = ($env.HOME       | path join ".cache")
$env.XDG_DATA_HOME             = ($env.HOME       | path join ".local/share")
$env.dots                      = $env.XDG_CONFIG_HOME
$env.shared                    = $env.XDG_DATA_HOME
$env.scripts                   = ($env.HOME       | path join ".local/bin")
$env.nushell                   = ($env.HOME       | path join ".config/nushell")
$env.nu_config                 = ($env.HOME       | path join ".config/nushell/config.nu")
$env.nu_env                    = ($env.HOME       | path join ".config/nushell/env.nu")
$env.PYENV_ROOT                = ($env.HOME       | path join ".pyenv")
$env.CARGO_HOME                = ($env.HOME       | path join ".config/cargo")
$env.RUSTUP_HOME               = ($env.HOME       | path join ".config/rustup")
$env.PYTHONNOUSERSITE          = "1" 
$env.GOPATH                    = ($env.dots       | path join "go")

let my_paths = [
    ($env.HOME       | path join ".local/bin")
    ($env.CARGO_HOME | path join "bin")
    ($env.PYENV_ROOT | path join "bin")
    ($env.PYENV_ROOT | path join "shims")
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/local/sbin"
    "/usr/sbin"
    "/sbin"
]
$env.PATH = ($my_paths | prepend $env.PATH | uniq)

# ========================================================================== #
#  Keyboard                                                                  #
# ========================================================================== #
$env.skk                       = ($env.shared     | path join "fcitx5/skk/user.dict")
$env.qmk                       = ($env.dots       | path join "qmk")
$env.noodle_qmk                = ($env.qmk        | path join "qmk_firmware/keyboards/themadnoodle/noodlepad/keymaps/default/")
$env.keyboard                  = ($env.HOME       | path join "keyboard")
$env.planck                    = ($env.KEYBOARD   | path join "planck")
$env.noodle                    = ($env.KEYBOARD   | path join "noodle")
 
# ========================================================================== #
#  GPU                                                                       #
# ========================================================================== #
# $env.LIBVA_DRIVERS_PATH      = "/usr/lib/x86_64-linux-gnu/dri"
$env.LIBVA_DRIVER_NAME         = "nvidia"
$env.NVD_BACKEND               = "direct"
$env.MOZ_DISABLE_RDD_SANDBOX   = "1"
# $env.MOZ_X11_EGL             = "1"
$env.__GL_GSYNC_ALLOWED        = "0"
$env.__GL_VRR_ALLOWED          = "0"
$env.LD_LIBRARY_PATH           = "/usr/lib/x86_64-linux-gnu/"

# ========================================================================== #
#  Input Method                                                              #
# ========================================================================== #
$env.XMODIFIERS                = "@im=fcitx"
$env.GTK_IM_MODULE             = "fcitx"
$env.QT_IM_MODULE              = "fcitx"
$env.DefaultIMModule           = "fcitx"
  
# ========================================================================== #
#  Document and Media                                                        #
# ========================================================================== #
$env.cheatsheets               = ($env.dots       | path join "cheatsheets")
$env.podcasts                  = ($env.HOME       | path join "podcasts")
$env.frotxz                    = ($env.HOME       | path join "frotz")
$env.screenshots               = ($env.HOME       | path join "pictures/screenshots")
$env.pict_iphone               = ($env.HOME       | path join "pictures/iphone")
$env.sounds                    = ($env.dots       | path join "sounds")
$env.radio_station             = ($env.HOME       | path join "radio-stations")
$env.mtupuls                   = ($env.HOME       | path join "mtupulse")
$env.bookmarks                 = ($env.HOME       | path join "bookmarks")
$env.boxes                     = ($env.HOME       | path join "boxes")
$env.theme                     = ($env.dots       | path join "themes")
$env.theme_configure           = ($env.theme      | path join "base/configure")
$env.theme_style               = ($env.theme      | path join "base/styles")
$env.theme_current             = ($env.theme      | path join "current-theme")
$env.theme_engine              = ($env.HOME       | path join "workspace/python/theme-manager")

# ========================================================================== #
#  Workspaces                                                                #
# ========================================================================== #
$env.cpp                       = ($env.HOME       | path join "workspace/cpp")
$env.python                    = ($env.HOME       | path join "workspace/python")
$env.python_playground         = ($env.python     | path join "playground")
$env.c                         = ($env.HOME       | path join "workspace/c")
$env.c_playground              = ($env.c          | path join "playground")
$env.asm                       = ($env.HOME       | path join "workspace/asm")
$env.reversing                 = ($env.HOME       | path join "workspace/reversing")
$env.rust                      = ($env.HOME       | path join "workspace/rust")
$env.dropman                   = ($env.cpp        | path join "dropmanager/src")
$env.shapequake                = ($env.c          | path join "shapequake")
$env.sq_server                 = ($env.shapequake | path join "server")
$env.sq_shell                  = ($env.shapequake | path join "shell")

# ========================================================================== #
#  Job Operations                                                            #
# ========================================================================== #
$env.jobops                    = ($env.HOME       | path join "jobops/")
$env.dev_jobops                = ($env.python     | path join "jobops/scripts")
$env.rpp                       = ($env.HOME       | path join "jobops/rpp")
$env.rpp_backdata              = ($env.HOME       | path join "jobops/rpp/backdata")
$env.rpp_input                 = ($env.HOME       | path join "jobops/rpp/backdata/input")
$env.rpp_conf                  = ($env.python     | path join "jobops/scripts")
$env.order                     = ($env.HOME       | path join "jobops/data")

# ========================================================================== #
#  App Configurations                                                        #
# ========================================================================== #
$env.aerc                      = ($env.dots       | path join "aerc")
$env.nimble                    = ($env.dots       | path join "nimble")
$env.alacritty                 = ($env.dots       | path join "alacritty")
$env.ghostty                   = ($env.dots       | path join "ghostty")
$env.kitty                     = ($env.dots       | path join "kitty")
$env.tmux_conf                 = ($env.dots       | path join "tmux")
$env.sniffnet                  = ($env.dots       | path join "sniffnet")
$env.gdb                       = ($env.dots       | path join "gdb")
$env.i3                        = ($env.dots       | path join "i3")
$env.helix                     = ($env.dots       | path join "helix")
$env.dunst                     = ($env.dots       | path join "dunst")
$env.ibus                      = ($env.dots       | path join "ibus")
$env.lftp                      = ($env.dots       | path join "lftp")
$env.mpd                       = ($env.dots       | path join "mpd")
$env.mpv                       = ($env.dots       | path join "mpv")
$env.ncmpcpp                   = ($env.dots       | path join "ncmpcpp")
$env.picom                     = ($env.dots       | path join "picom")
$env.posh                      = ($env.dots       | path join "posh")
$env.w3m                       = ($env.dots       | path join "w3m")
$env.qutebrowser               = ($env.dots       | path join "qutebrowser")
$env.boxes_conf                = ($env.dots       | path join "boxes/boxes-config")
$env.warpd                     = ($env.dots       | path join "warpd")
$env.tldr                      = ($env.dots       | path join "tldr")
$env.TLDR_CONFIG_DIR           = ($env.dots       | path join "tldr")
$env.GNUPGHOME                 = ($env.dots       | path join "gpg")
$env.PASSWORD_STORE_DIR        = ($env.dots       | path join "pass")

# ========================================================================== #
#  Oh My Posh                                                                #
# ========================================================================== #
oh-my-posh init nu --config ($env.dots | path join "posh/config.json") | save -f ~/.cache/oh-my-posh.nu
