## Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias src='source ~/.bashrc'
alias free='free -mt'
#alias ll='ls -alF'
#alias la='ls -A'
alias l='ls -CF'
#alias ls='ls -hBG'
alias l.='ls -d .*'
#alias l.="ls -A | egrep '^\.'" 
alias ls="ls --group-directories-first --time-style=+'%d.%m.%Y %H:%M' --color=auto -hFX"
alias ll="ls -l --group-directories-first --time-style=+'%d.%m.%Y %H:%M' --color=auto -F"
alias la="ls -la --group-directories-first --time-style=+'%d.%m.%Y %H:%M' --color=auto -F"
alias fuck="sudo !!"
alias git-source='git config --get remote.origin.url'
alias glg='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate'
alias glgh='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate | head'
alias glo='git log --oneline --decorate'
alias gloh='git log --oneline --decorate | head'
alias path='echo $PATH | tr -s ":" "\n"'
alias mount='mount |column -t'
alias mkdir="mkd"
alias getip='grep -oE "\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"'

# View and set wallpaper with feh
alias feh-view="feh --scale-down --auto-zoom"
alias feh-set="feh --bg-fill"

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# requires installing tool "opting"
## Use: optimize image.png
alias optimize="optipng -o7 -f4 -strip all -quiet"

# faster bundle
alias bundle3="bundle install -j3"

alias git_commits_in_dates_with_author='git log --pretty=format:"%h%x09%an%x09%ad%x09%s" > git_output.txt'
alias git_commits_in_dates_without_author='git log --pretty=format:"%h%x09%ad%x09%s" > git_output.txt'
alias git_commits_in_dates_with_name_and_date='git log --pretty=format:"%ad%x09%s" > git_output.txt'
alias gita='git archive --format=zip master > $1'
alias gitb='git branch --sort=-committerdate | head -n 5'
