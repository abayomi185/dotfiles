# Terminal color config
export TERM=xterm-256color

export THEOS=~/theos

export PATH="$HOME/.gem/ruby/2.6.3/bin:$PATH"

export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# Make the terminal safe
set -o noclobber
#alias cp='cp -i'
#alias mv='mv -i'

# Show neofetch on launch
#neofetch

#export VIRTUALENVWRAPPER_PYTHON=`which python`
#export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`

# Virtualenvwrapper things
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

#Pico things
export PICO_SDK_PATH="$HOME/pico/pico-sdk"

#To allow Multi-threading scripts macOS
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#Disable Homebrew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

# Homebrew Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

##
# Your previous /Users/yomi/.zprofile file was backed up as /Users/yomi/.zprofile.macports-saved_2024-02-10_at_19:54:11
##

# MacPorts Installer addition on 2024-02-10_at_19:54:11: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2024-02-10_at_19:54:11: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

