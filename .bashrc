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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# git
function git_branch_color {
    status=$( git diff --shortstat 2>/dev/null )
    if [ "x$status" != 'x' ]; then
        color=$( git config color.status.changed )
    else
        color=$( git config color.branch.current )
    fi
    echo -ne $color
}

function term_set_color {
    params="$@"
    if [ "x$params" != 'x' ]; then
        perl -MTerm::ANSIColor -E "say color('$params')";
    else
        perl -MTerm::ANSIColor -E "say color('reset')";
    fi
}

if [ "$color_prompt" = yes ]; then
    PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;33;40m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[$(term_set_color $(git_branch_color))\]$(__git_ps1 " %s")\[\033[00m\]]\$ '
else
    PS1='[${debian_chroot:+($debian_chroot)}\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias rgrep='rgrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# uncomment if needed
#if [ -d ~/.bash_completion.d ]; then
#    for i in $(ls ~/.bash_completion.d); do
#        i=~/.bash_completion.d/$i
#        [[ ${i##*/} != @(*~|*.bak|*.swp|\#*\#|*.dpkg*|*.rpm@(orig|new|save)|Makefile*) \
#            && -f $i && -r $i ]] && . "$i"
#    done
#fi

#
# path & apply shell script
#
#   - libreoffice
#       /usr/lib/libreoffice/sdk/setsdkenv_unix.sh \
#   - vte for new terminal
#   - android adt sdk
#   - ActiveState Perl 5.14
#   - ActiveState PDK
#   - npm coffee script
#   - rbenv
#   - perlbrew
#   - ~/.bin
#
for i in \
    /etc/profile.d/vte.sh \
    $HOME/install/adt-bundle-linux/sdk/tools \
    $HOME/install/adt-bundle-linux/sdk/platform-tools \
    $HOME/install/as/ActivePerl-5.14/bin \
    $HOME/install/as/ActivePerl-5.14/site/bin \
    $HOME/install/as/pdk/bin \
    $HOME/.npm/coffee-script/1.3.3/package/bin \
    $HOME/.rbenv/bin \
    $HOME/.gem/ruby/1.8/bin \
    /opt/perl5/perlbrew/etc/bashrc \
    $HOME/perl5/perlbrew/etc/bashrc \
    $HOME/.bin \
    ; do
        [[ -f $i && -r $i       ]] && . $i
        [[ -d $i                ]] && PATH="$i:$PATH"
        [[ $i =~ rbenv && -d $i ]] && eval "$(rbenv init -)" && export RBENV_VERSION=1.9.3-p448
        [[ $i =~ pyenv && -d $i ]] && eval "$(pyenv init -)" && export PYENV_VERSION=2.7.10
    done

# anyenv
export ANYENV_ROOT="/opt/anyenv"
export PATH="$ANYENV_ROOT/bin:$PATH"
eval "$(anyenv init -)"
export RBENV_VERSION=2.5.1
export NDENV_VERSION=v8.11.3
export PYENV_VERSION=3.7.0

#
# man path
#
#   - ActiveState Perl 5.14
#   - ActiveState PDK
#
#for i in \
#    $HOME/install/as/ActivePerl-5.14/man \
#    $HOME/install/as/ActivePerl-5.14/site/man \
#    $HOME/install/as/pdk/share/man \
#    ; do
#        [[ -d $i ]] && MANPATH="$i:$MANPATH"
#    done

#
# Adjust $PATH since libreoffice makes it hell
#
#   - remove duplicated /usr/bin
#
PATH=` echo $PATH | perl -aF':' -nlE 'my @p = split /:/; my $c = 0; @p = reverse map { if ( m{/usr/bin} ) { $c++ == 0 ? $_ : () } else { $_ } } reverse @p; say join ":", @p;' `

#
# CUSTOM EXPORT VARIABLE
#

export EDITOR=vim

# author for catalyst
export AUTHOR='Keedi Kim'

# Perl
export PAGER='less'    # for perldoc
export LESS='-R'       # for perldoc
export LESS='-R -F -X' # for perldoc

# Java
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

# Java & Perl
# using JNI option of Inline::Java
export PERL_INLINE_JAVA_JNI=1
# library path
LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server:$JAVA_HOME/jre/lib/amd64/jli:$JAVA_HOME/jre/lib/ext:$LD_LIBRARY_PATH

# gnome build
ACLOCAL_FLAGS="-I /usr/share/aclocal"

# perl
#export PERL5LIB=lib:.lib/lib/perl5:$PERL5LIB
#export PERL_CPANM_OPT="--mirror http://cpan.metacpan.org"
export AE_LOG=log=stderr:filter=debug
export PERL_OBJECT_EVENT_DEBUG=2

# libsass + sassc
export SASS_LIBSASS_PATH=$HOME/workspace/github/libsass

# android-studio
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export PATH="/opt/android/android-studio/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME:platform-tools:$PATH"

# yarn
export PATH="$PATH:`yarn global bin`"
