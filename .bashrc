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

if [[ "$OSTYPE" == "cygwin" ]]; then
    export CYGWIN="winsymlinks:native"
fi

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
    xterm-color|xterm-256color|screen-256color|linux) color_prompt=true;;
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
export GIT_PS1_SHOWSTASHSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true

try_load_git_prompt() {
    # first, see if git-prompt has been executed and the environment is all good
    if [ "`type -t __git_ps1`" ]; then
        return 1
    fi

    # if not, try to look for git-prompt.sh in known locations
    if [ -f "git-prompt.sh" ]; then
        source "git-prompt.sh"
        return 1
    elif [ -f "${HOME}/git-prompt.sh" ]; then
        source "${HOME}/git-prompt.sh"
        return 1
    elif [ -f "found=$(whereis 'git-prompt.sh' | cut -f2 -d':')" ]; then
        echo $found
        echo "Found git-prompt.sh, linking to home"
        ln -s "${HOME}/git-prompt.sh" "$found"
        source "$found"
        return 1
    fi

    # if still not, ask to git clone it to a local directory
    shopt -s nocasematch
    while read -p "git-prompt.sh could not be found, try downloading [Y|n]? " ans;
    do
        if [ -z "$ans" -o "$ans" == "y" ]; then
            $(cd $HOME && wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh")
            return 1
        elif [ "$ans" == "n" ]; then
            return 0
        fi
    done
    shopt -u nocasematch

    # otherwise, we cannot use git-prompt
    return 0

}

case "$OSTYPE" in
    cygwin)
        try_load_git_prompt
        if [ $? -eq 0 ]; then
            export PROMPT_GIT_MODE=false
        else
            export PROMPT_GIT_MODE=true
        fi
        ;;
    linux-*)
        export PROMPT_GIT_MODE=true
        ;;
    *)
        ;;
esac

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

    # reset the PS1 so we can work on it
    PS1=""

    if [ "$color_prompt" = true ]; then
        # old and busted
        # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\h:\[\033[01;34m\]\w\[\033[00m\]\$ '

        # the new hotness
        if [ -f "$HOME/.bash/.bash_codes" ]; then
            # We only need to do this once, otherwise there is slowdown
            if [ ! -n "$BASH_CODES" ]; then
                source "$HOME/.bash/.bash_codes"
            fi

            # variables to assist with PS1 creation, modularity, and readability
            PTXT="\[${_GREENBG}${_BLACKFG}\]"
            CWD="${PTXT} \w"
            # LEADER="\[${REDBG}\]\[${GREENFG}\]\[${BLACKFG}\] $?\[${REDFG}\]\[${BLACKBG}\]\[${BLACKBG}\]\[${GREENFG}\] "
            if [ "$LAST_CODE" -eq 0 ]; then
                LEADER="\[${_GREENFG}${_BLACKBG}\]\[${_BLACKBG}${_GREENFG}\] "
            else
                LEADER="\[${_GREENFG}${_REDBG}\]\[${_BLACKBG}${_REDFG}\] "
            fi

            # git mode
            local is_git="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
            if [ "$is_git" -a "$PROMPT_GIT_MODE" = true -a "`type -t __git_ps1`" ]; then
                local COLOR=${_BOLD}${_WHITEFG}
                if [ -n "$PROMPT_GIT_COLOR" ]; then
                    COLOR=$PROMPT_GIT_COLOR
                fi
                # PS1="${PS1}\[${BLACKFG}${GREENBG}\]\[${COLOR}\]$(__git_ps1 '  %s ')\[${BLACKFG}${GREENBG}\]"
                PS1="\[${_RESET}\]\[${_BLACKFG}${_GREENBG}\]\[${_BLACKFG}${_BLUEBG}\]$(__git_ps1 '  %s ')\[${BGTXT}\]"
            fi

            PRE_WRAP="${PTXT}┌─"
            WRAP="└─>"

            if [ "${#PWD}" -gt $(( `tput cols` / 3 )) ]; then
                PS1="\[${_RESET}\]${PRE_WRAP}${PS1}${CWD}\[${_GREENFG}${_BLACKBG}\]\n\[${_GREENBG}${_BLACKFG}\]${WRAP}"
            else
                PS1="${PS1}\[${_RESET}\]${CWD}"
            fi

            PS1="${PS1}\[${_RESET}\]${LEADER}\[${_RESET}\]"

        else
            PS1="\[\e[30;42m\] \w\[${_RESET}\]\[\e[32m\]\[${_RESET}\] "
        fi
        # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

    else
        PS1="\h\w $ "
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

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "$color_prompt" = true ]; then
    alias ls='ls -a --color=auto'
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

if [ -f "$HOME/.bash/.bash_aliases" ]; then
    . "$HOME/.bash/.bash_aliases"
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

if [ -f "${HOME}/.bash/.bash_functions" ]; then
  source "${HOME}/.bash/.bash_functions"
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
alias perms='stat -c "(%a)%A %n"'
alias humsize='numfmt --to=iec --padding 4'
alias xcolors='xfce4-terminal --color-table'
alias ducks='du -cks * | sort -rn | head'
alias duckish='du -cksh * | sort -rh | head'
alias ducksh=duckish

# git short-hands
alias gis="git status"
alias gic="git commit"
alias gia="git add"
alias gir="git rebase"

case "$OSTYPE" in
    linux-*)
        alias setclip='xclip -selection c'
        alias getclip='xclip -selection clipboard -o'
        ;;
    cygwin)
        alias explore='xdg-open .'
        ;;
    *)  ;;
esac

###
# Path
###
# IDEA:
# Find folders in /usr/local/bin and add them to path
# is this a good idea?

PATH=$PATH:/usr/local/bin/node # add node to bins
# not sure if the best location
# I'm using this for my custom shell scripts and such
PATH=$PATH:~/opt/bin
# Dangerous, but at least safer if appended rather than prepended
PATH=$PATH:.
export PATH

# Adds my path when set as root
if [ "$(id -u)" = "0" ]; then
   export PATH=$PATH:/usr/local/bin/node
fi


###
# Welcome Message
###
uname -a

if [ "$PROMPT_GIT_MODE" = true ]; then
    COLOR=${_GREENFG}
else
    COLOR=${_REDFG}
fi
echo "Prompt Git Mode: [${COLOR}${PROMPT_GIT_MODE:-false}${_RESET}]${_RESET}. Change with 'git(${_GREENFG}on${_RESET}|${_REDFG}off${_RESET})'."


# autoload scripts
# note: find in a subshell so that sourcing doesn't happen in the subshell
if [ -d "$HOME/.bash/autoload" ]; then
    for f in $(find "$HOME/.bash/autoload/" -follow -print);
    do
        if [ -d "$f" ]; then
            continue;
        fi

        source "$f";
    done
fi


# A solution to kill/yank syncing to system clipboard
# proposed by "ephemient"
# http://stackoverflow.com/questions/994563/integrate-readlines-kill-ring-and-the-x11-clipboard

# _xdiscard() {
    # echo -n "${READLINE_LINE:0:$READLINE_POINT}" | xclip
    # READLINE_LINE="${READLINE_LINE:$READLINE_POINT}"
    # READLINE_POINT=0
# }
# _xkill() {
    # echo -n "${READLINE_LINE:$READLINE_POINT}" | xclip
    # READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}"
# }
# _xyank() {
    # READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$(xclip -o)${READLINE_LINE:$READLINE_POINT}"
# }
# bind -m emacs -x '"\eu": _xdiscard'
# bind -m emacs -x '"\ek": _xkill'
# bind -m emacs -x '"\ey": _xyank'
