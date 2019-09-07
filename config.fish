# set up custom PATHs

set -x PATH ~/Downloads/jdk-13.jdk/Contents/Home/bin $PATH
set -x PATH ~/.cargo/bin $PATH
set -x PATH /usr/local/Cellar/gcc/9.2.0/bin/ $PATH
set -x PATH ~/Software/Idris2 $PATH
set -x PATH ~/Software/zig/build $PATH

# custom aliases

alias gcc=gcc-9
alias g++=g++-9

# rbenv config

status --is-interactive; and source (rbenv init -|psub)


