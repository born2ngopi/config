set -g -x fish_greeting screenfetch

#golang path setup using fish
set -x GOPATH /home/chandra/go
set -x GOROOT /usr/local/go
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

set -gx PATH /opt/gradle/gradle-5.2.1/bin/ $PATH

#rust setup path 
set -x PATH $HOME/.cargo/bin $PATH

#rbenv
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source
