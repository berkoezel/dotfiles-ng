#general-exports
export ZSH="$HOME/.oh-my-zsh"
export ZSH="/home/berk/.oh-my-zsh"

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin/
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH":$HOME/.gobin
export GOPATH="$HOME/go"
export CLASSPATH=$JUNIT_HOME/junit-4.10.jar

export GO111MODULE=on
export QT_QPA_PLATFORMTHEME=gtk2
#plugins
plugins=(git
         history
         command-not-found
         copypath
         extract
         )

#aliases

#youtube-dl
alias ytm4a='youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" -v --extract-audio --audio-quality 0 --audio-format m4a'
alias ytmp4='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" --output "%(title)s.%(ext)s"'

#qemu
alias qemu-isoboot='function _f(){qemu-system-x86_64 -hda $1 -cdrom $2 -boot d -m 8G -cpu host -smp 2 -machine accel=kvm -nic user,hostfwd=tcp::60022-:22};_f'
alias qemu-vmup='function _f(){qemu-system-x86_64 -hda $1 -boot d -m 8G -cpu host -smp 2 -machine accel=kvm -nic user,hostfwd=tcp::60022-:22 };_f'

##misc
alias nightlight="redshift -O 3000 > /dev/null"
alias displayoff="xset dpms force off"
alias javac8="/usr/lib/jvm/java-1.8.0-amazon-corretto/bin/javac"
alias java8="/usr/lib/jvm/java-1.8.0-amazon-corretto/bin/java"
alias vim="nvim"
alias lsalias="grep alias ~/.zshrc"
alias sx='startx'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias nano='nvim'
alias vim='nvim'

source $ZSH/oh-my-zsh.sh

#zsh-options
set nonomatch
ZSH_THEME="lukerandall"
source $ZSH/oh-my-zsh.sh
