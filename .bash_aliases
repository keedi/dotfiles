# editor
alias vi='vim'

alias realias='$EDITOR ~/.aliases; source ~/.aliases'
#
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# tmux
alias tmux='tmux -2'

# for shell
alias grep='grep --color'
alias rgrep='rgrep --color -r'
alias l='ls -aF'
alias ll='ls -alF'
alias d='diff -u'
alias fs='find . | perl -nle "!/\.svn/ and print" | xargs grep . | grep'
alias ek='dic.pl ek'
alias ke='dic.pl ke'
alias o='gnome-open'
alias du='du -h'

# rsync
alias rsync-ssh='rsync -avzhe ssh --progress'

# fot tidy
alias tidy='tidy -config ~/.tidyrc'

# for perl
alias perldoc="perldoc -MPod::Text::Color::Delight"
alias darkpanm='cpanm --mirror="https://darkpan.silex.kr" --mirror="http://cpan.silex.kr" --mirror-only'
alias reperl='perl -de0'
alias pmver="perl -le '\$m = shift; eval qq(require \$m)
    or die qq(module \"\$m\" is not installed\\n); print \$m->VERSION'"
alias cpan-installed="perl -MExtUtils::Installed -E 'say for ExtUtils::Installed->new->modules'"
alias dperl="perl -MList::MoreUtils=uniq -MFile::Find::Rule -MFile::Find::Rule::Perl -E '@ARGV = File::Find::Rule->perl_file->in(@ARGV); exit unless @ARGV; while (<>) { push @modules, \$1 if /^\s*use\s+([A-Za-z][_A-Za-z0-9:]+)/ } say for uniq sort @modules;'"
function pmvi { $EDITOR `perldoc -l $1`; }
function pmcd { PMPATH=`perldoc -l $1`; cd `dirname $PMPATH`; }
alias pmname="perl -MFile::Basename -nlE '(\$_ = basename(\$_, q{.tar.gz})) =~ s/-v?[0-9]+(\.[_0-9]+)+\$//; s/-/::/g; print '"
alias pminstalled="perl -MExtUtils::Installed -E 'say for ExtUtils::Installed->new->modules'"
alias pmvinstalled="perl -MExtUtils::Installed -E'\$i = ExtUtils::Installed->new; printf qq{%-40s %s\n}, \$_, \$i->version(\$_) for \$i->modules'"
alias my-fatpack="perl -E'@m = @ARGV; map { s{::}{/}g; \$_ .= q{.pm}; } @m; system qq{fatpack tree \`fatpack packlists-for @m\`}; say q{#!/usr/bin/env perl}; system q{fatpack file}; say qq{\n# YOUR CODE GOES HERE};'"
alias uri-escape="perl -MEncode -MURI::Escape -E 'say uri_escape_utf8(decode_utf8(shift))'"
alias apaxy="plackup -MPlack::App::Directory::Apaxy -s Starlet --max-workers=5 -e 'Plack::App::Directory::Apaxy->new->to_app'"

# zip
alias kunzip="perl -MEncode=decode -MArchive::Zip -E '\$z=Archive::Zip->new; \$z->read(shift); \$z->extractMember(\$_,decode(qq{cp949},\$_->fileName)) for \$z->members;'"

# these are from Yuval Kogman
alias pod=perldoc
alias ts="prove --state=slow,save -j3 -r"
alias tf="prove --state=failed,save -v -r"

alias hunter="perl -MFile::Find::Rule -MFile::Find::Rule::Perl -E 'say for File::Find::Rule->perl_file->in(q{.})' | xargs perlachievements scan"

alias lperl='PERL5LIB=lib:.lib:$PERL5LIB perl'

#LOCALLIB=/home/keedi/locallib
#PATH=~/locallib/bin:~/workspace/perl/slide/mkslide/bin:$PATH

# silex
alias bugzilla-summary='git log --stat -1; echo; git log --pretty=format:"* %cd %h  - %s (%an)" --date=short HEAD^..HEAD; echo; git diff --stat HEAD^..HEAD'

#alias grep='perl -MTerm::ANSIColor=:constants -nlE "print} BEGIN {warn BOLD, RED, q{use ack please}, RESET, qq{\n};" | ack'

# git
alias git-ls='for k in `git branch|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'
alias git-archive-here='git archive --format=tar HEAD | gzip'

# git flow
alias gf='git flow'
alias feature='git flow feature'
alias release='git flow release'

#alias sshr='ssh -l root'
#alias scpresume='rsync --partial --progress -ae ssh'
alias hosts='sudo vi /etc/hosts'
alias realias='$EDITOR ~/.bash_aliases; source ~/.bash_aliases'

# sass & scss
alias css2sass='perl -MText::Sass -MFile::Slurp -E "say Text::Sass->css2sass(scalar read_file(shift))"'
alias sass2css='perl -MText::Sass -MFile::Slurp -E "say Text::Sass->sass2css(scalar read_file(shift))"'

# clipboard
alias cb='xclip -selection clipboard'

# util
alias dt='perl -MDateTime -E "\$dt = DateTime->now(time_zone => shift || q{Asia/Seoul}); say join q{ }, \$dt->ymd, \$dt->hms, \$dt->time_zone->name"'

# joke
alias 2bul='perl -MLingua::KO::TypoCorrector -nlE "binmode STDOUT, q{:utf8}; say toKorean(\$_)"'

# youtube download
alias yd='youtube-download -o "[{video_id}] {title}.{suffix}"'

# for yuni timezone
alias yunitz='perl -MDateTime -E "say DateTime->now(time_zone => q{America/Los_Angeles})"'
alias gmttz='perl -MDateTime -E "say DateTime->now->format_cldr(q{yyyy-MM-dd HH:mm:ss})"'

# since mistake
alias systemctl='echo "Do you really want to systemctl? then use abs path"'

# mplayer mpv
alias mplayer='mplayer --no-config --sub-codepage=cp949'
