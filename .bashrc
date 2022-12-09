# .bashrc


# My bash config. Not much to see here; just some pretty standard stuff.

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.
	return
fi

### PROMPT
PS1='\[\e[0m\]┌─\[\e[0m\][\[\e[0m\]\u\[\e[0m\]@\[\e[0m\]\h\[\e[0m\]]\[\e[0m\]-\[\e[0m\][\[\e[0m\]\w\[\e[0m\]]\n\[\e[0m\]└──╼\[\e[0m\][\[\e[0m\]\$\[\e[0m\]]\[\e[0m\]> \[\e[0m\]'

# Terminal issues with SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="TERM='xterm' ssh"

export PATH=$HOME/.local/bin:$PATH
export EDITOR="nano"     # $EDITOR use Nano in terminal

### ARCHIVE EXTRACTION
# usage: extract <file>
extract () {
    if [ -f "$1" ] ; then
    case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias cat='/usr/bin/bat'
#export MANPAGER='/usr/bin/bat'

# Global aliases
alias '...'='../..'
alias '....'='../../..'
alias C='|wc -l'
alias G='|grep --color=auto'
alias H='|head'
alias L='|less'
alias LL='|& less -r'
alias M='|most'
alias N='&>/dev/null'
alias R='| tr A-z N-za-m'
alias SL='| sort | less'
alias S='| sort'
alias T='|tail'


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Colorize ls output
alias ls='ls --color=auto -rthlaN --group-directories-first'


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

#
export OO_PS4_TOOLCHAIN='~/Workspace/PS4Toolchain/'
