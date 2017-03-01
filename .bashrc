# TODO:
# I need to seriously clean up and modularize this and vimrc

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# TERM=xterm-256color
export EDITOR=vim
export PAGER=less

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=true;;
    xterm-256color) color_prompt=true;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=true

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
        color_prompt=true
    else
        color_prompt=
    fi
fi

# TODO: cleanup and refactor things
#       git mode, sudo, etc
#       wrap prompt as many lines as necessary

# git mode config
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_GIT_MODE=true
giton() {
    export PROMPT_GIT_MODE=true
}
gitoff() {
    export PROMPT_GIT_MODE=false
}

prompt_command()
{
    LAST_CODE=$?
    history -a;

    if [ "$color_prompt" = yes ]; then
        # old and busted
        # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\h:\[\033[01;34m\]\w\[\033[00m\]\$ '

        # the new hotness
        if [ -f "$HOME/.bash_codes" ]; then
            source "$HOME/.bash_codes"

            # variables to assist with PS1 creation, modularity, and readability
            PTXT="\[${GREENBG}${BLACKFG}\]"
            CWD="${PTXT} \w"
            # LEADER="\[${REDBG}\]\[${GREENFG}\]\[${BLACKFG}\] $?\[${REDFG}\]\[${BLACKBG}\]\[${BLACKBG}\]\[${GREENFG}\] "
            if [ "$LAST_CODE" -eq 0 ]; then
                LEADER="\[${GREENFG}${BLACKBG}\]\[${BLACKBG}${GREENFG}\] "
            else
                LEADER="\[${GREENFG}${REDBG}\]\[${BLACKBG}${REDFG}\] "
            fi

            PRE_WRAP="${PTXT}┌─"
            WRAP="└─>"

            if [ "${#PWD}" -gt $(( `tput cols` / 3 )) ]; then
                PS1="\[${RESET}\]${PRE_WRAP}${CWD} \n${WRAP}"
            else
                PS1="\[${RESET}\]${CWD}"
            fi

            # git mode
            local is_git="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
            if [ "$is_git" -a -n "$PROMPT_GIT_MODE" -a "`type -t __git_ps1`" ]; then
                local COLOR=${BOLD}${WHITEFG}
                if [ -n "$PROMPT_GIT_COLOR" ]; then
                    COLOR=$PROMPT_GIT_COLOR
                fi
                # PS1="${PS1}\[${BLACKFG}${GREENBG}\]\[${COLOR}\]$(__git_ps1 '  %s ')\[${BLACKFG}${GREENBG}\]"
                PS1="\[${RESET}${BLACKFG}${GREENBG}\]$(__git_ps1 '  %s ')\[${BLACKFG}${GREENBG}\]${PS1}"
            fi

            PS1="${PS1}\[${RESET}\]${LEADER}\[${RESET}\] "

        else
            PS1="\[\e[30;42m\] \w\[${RESET}\]\[\e[32m\]\[${RESET}\] "
        fi
        # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

    fi
    # unset color_prompt force_color_prompt

    # time=

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;[\A] ${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    # unset variables
    unset LAST_CODE

    # remove set_prompt from environment
    # however, we are reusing this function for PROMPT_COMMAND
    # unset -f $FUNCNAME
}
prompt_command

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "$color_prompt" = true ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    alias dirs='dirs -v'

    alias diff='diff -u --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


###
# Bash and terminal settings
###

shopt -s histverify histreedit
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND=prompt_command
# atttempt to save all lines to the same history entry
shopt -s cmdhist
# defer exit if jobs exist
shopt -s checkjobs



stty werase '^_' # delete word -> Ctrl+Backspace
stty eol '^^' # newline -> Ctrl+Enter
stty -ixon # Ctrl+S search history back



###
# Functions
###
# Some people use a different file for functions
# some of my functions

if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi


###
# Variables
###
# --no-init required if using --quit-if-one-screen
export LESS="--quit-if-one-screen --no-init --ignore-case --status-column --tabs=4 --HILITE-UNREAD --RAW-CONTROL-CHARS"

export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

###
# Aliases
###

alias cls=clear
alias wrap="echo You\'re looking for \'fold\'"
alias snow=let_it_snow
alias tasks=processes_from_this_terminal
alias pss=processes_from_this_terminal
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias perms='stat -c "%a %n"'
alias humsize='numfmt --to=iec --padding 4'
alias xcolors='xfce4-terminal --color-table'
alias ducks='du -cks * | sort -rn | head'
alias duckish='du -cksh * | sort -rh | head'
alias ducksh=duckish

###
# Path
###
# IDEA:
# Find folders in /usr/local/bin and add them to path
# is this a good idea?

# Dangerous, but at least safer if appended rather than prepended
PATH=$PATH.:
PATH=$PATH:/usr/local/bin/node # add node to bins
# not sure if the best location
# I'm using this for my custom shell scripts and such
PATH=$PATH:~/opt/bin
export PATH

# ADDS MY PATH WHEN SET AS ROOT
if [ "$(id -u)" = "0" ]; then
   export PATH=$PATH:/usr/local/bin/node
fi


###
# Welcome Message
###
uname -a
echo "Prompt Git Mode: [${PROMPT_GIT_MODE:-false}]. Change with 'git(on|off)'."
