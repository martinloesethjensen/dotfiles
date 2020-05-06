set -x PATH $PATH /sbin/

export LC_ALL=en_US.UTF-8

thefuck --alias | source 

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Flutter
export PATH="$PATH:/Users/mlj/flutter/bin"
# Pub installs executables into $HOME/flutter/.pub-cache/bin,
export PATH="$PATH":"$HOME/flutter/.pub-cache/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export PATH="$PATH:/usr/local/anaconda3/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/Users/mlj/.cargo/bin:$PATH"

# Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"


alias reload="exec $SHELL"
alias fish-config="code ~/.config/fish/config.fish"
alias fish-update="omf u; fisher"

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# Also update fisher, oh my fish and flutter
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup; omf u; fisher; flutter upgrade'

# Update, upgrade, and cleanup brew
alias brew-upgrade="brew update && brew upgrade && brew cleanup && brew cask upgrade"

# forced remove
alias nuke="rm -rf"

# Open in Foxit Reader
alias foxit="open -a Foxit\ Reader"

# IDEA aliases for cli
alias idea="/usr/local/bin/idea/idea"
alias charm="/usr/local/bin/idea/charm"
alias datagrip="/usr/local/bin/idea/datagrip"
alias goland="/usr/local/bin/idea/goland"
alias studio="/usr/local/bin/idea/studio"
alias as="/usr/local/bin/idea/studio"

# Apply ktlint with .editorconfig
alias ktlint-config="brew list ktlint | brew upgrade ktlint || brew install ktlint && curl -s -L "https://raw.githubusercontent.com/adaptdk/am-ktlint-pre-commit/master/pre-commit" > ../.git/hooks/pre-commit && chmod 755 ../.git/hooks/pre-commit && curl -s -L "https://raw.githubusercontent.com/adaptdk/am-ktlint-editorconfig/master/.editorconfig" > .editorconfig"

# hub === git
alias git='hub'
alias g='git'

# Python & pip aliases
alias pip="pip3"
alias python="python3"
alias py="python3"

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Recursively delete `.DS_Store` files
alias cleanup-ds-store="find . -type f -name '*.DS_Store' -ls -delete"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
# Not working: sudo rm -rfv /private/var/log/asl/*.asl; sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash;
alias emptytrash="sudo rm -rfv ~/.Trash; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Print each PATH entry on a separate line
alias path='echo -e $PATH//:/\\n'

# openjdk
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

# For pj to look for your projects
set -gx PROJECT_PATHS ~/work ~/Dropbox/projects/ ~/sandbox/ ~/Dropbox/sandbox/ ~/Dropbox/workshops/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

