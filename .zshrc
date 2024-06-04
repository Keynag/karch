#Myzsh by keyn73
################

HISTFILE=~/.histfile
HISTSIZE=666
SAVEHIST=666
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
export PATH=/home/keyn/.local/bin:$PATH


## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt beep                                                     # beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

unsetopt NO_BEEP
unsetopt NO_MATCH
setopt NOMATCH
setopt NOTIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST
setopt NULL_GLOB

autoload compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache



## Plugins section

# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down



## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action


## Alias section

alias zconf="vim ~/.zshrc"
alias vim="nvim"
alias timeshift="sudo -E timeshift-gtk"
alias gparted="sudo -E gparted"
alias hamachi-start="sudo systemctl start logmein-hamachi.service && sudo hamachi list"
alias hamachi-stop="sudo systemctl stop logmein-hamachi.service"
alias hamachi="sudo hamachi"
#alias protontricks="/home/keyn/.local/bin/protontricks --gui"


autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

export LESS_TERMCAP_mb=$'\e[1;32m'

alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'

#alias bat
alias bat='bat --theme=ansi'
command -v bat > /dev/null && alias cat='bat --pager=never'
command -v bat > /dev/null && alias cat='bat'

#alias ls
command -v lsd > /dev/null && alias ls='lsd --group-dirs first --color=auto -A -F'
alias lst='lsd --tree'
alias lsh='lsd --help'

#alias grep fgrep egrep diff
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

#alias top
command -v btop > /dev/null && alias top='btop'

#подключение к VPS-серверу
alias eva-wg='ssh root@185.247.19.197'

#подключение vpn(wg.conf)
alias wg-up='sudo wg-quick up ~/.config/wg.conf'
#отключение vpn(wg.conf)
alias wg-down='sudo wg-quick down ~/.config/wg.conf'

#GUI manager eva-wg
alias wg="http://185.247.19.197:51821/"

#Очистка консоли
alias cls='clear'

#Clear pacman and yay
alias rsp='sudo pacman -Rscn $(pacman -Qtdq)'
alias rsy='paru -Rscn $(paru -Qtdq)'

#reboot and poweoff
alias off="sudo systemctl poweroff"
alias reb="sudo systemctl reboot"



# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


#grc
if [ -f /usr/bin/grc ]; then
 alias gcc="grc --colour=auto gcc"
 alias irclog="grc --colour=auto irclog"
 alias log="grc --colour=auto log"
 alias netstat="grc --colour=auto netstat"
 alias ping="grc --colour=auto ping"
 alias proftpd="grc --colour=auto proftpd"
 alias traceroute="grc --colour=auto traceroute"
fi


# enable substitution for prompt
setopt prompt_subst

#black = 0 | red = 1 | green = 2 | yellow = 3

#blue = 4 | magenta = 5 | cyan = 6 | white = 7

PROMPT="
$fg[blue]╭─%{$reset_color%}$fg[cyan](%{$reset_color%}$fg[magenta] %n%{$reset_color%}$fg[cyan])%{$reset_color%}$fg[red]─%{$reset_color%}$fg_bold[yellow](  %~)%{$reset_color%}$fg[blue]
╰ "


case $(basename "$(cat "/proc/$PPID/comm")") in
    login)
    RPROMPT="%{$fg[red]%} %(?..[%?])"
    alias x='startx ~/.xinitrc';;
*)

# Use autosuggestion
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ccc'
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-command-time/command-time.plugin.zsh
    ;;
esac


# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=1

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="
Время исполненния: %s"

# Message color.
ZSH_COMMAND_TIME_COLOR="green"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit nano nvim)


zsh_command_time()
{
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME сек."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min мин. $sec сек."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours ч. $min мин. $sec сек."
            else
                timer_show="$fg[red]$min мин. $sec сек."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}


#color term
#if command -v wal > /dev/null 2>&1 && [ "$TERM" = "alacritty" ]; then
#    wal -Rqe
#fi
fastfetch
