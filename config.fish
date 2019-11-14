# set up custom PATHs
set -x PATH ~/Library/Java/JavaVirtualMachines/openjdk-14/Contents/Home/bin $PATH
set -x PATH ~/.cargo/bin $PATH
set -x PATH /usr/local/Cellar/gcc/9.2.0/bin/ $PATH
set -x PATH ~/Software/Idris2 $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.ghcup/bin $PATH
set -x PATH ~/.cabal/bin $PATH

## opam config
eval (opam env)
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
#
## llvm config
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths

ssh-add ~/.ssh/mbp

set -x LC_ALL en_US.UTF-8

set -x PATH ~/code/scripts $PATH
alias runc=runc.sh
alias runcpp=runcpp.sh
alias runjava=runjava.sh
alias runrs=runrs.sh
alias runpy=runpy.sh

## set variable for the racer vim plugin 
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

## postgres configuration
alias pgstart="pg_ctl -D ~/.local/postgresdb -l ~/.local/postgresdb/logs/logfile start"
alias pgstop="pg_ctl -D ~/.local/postgresdb stop"
alias pgrestart="pg_ctl -D ~/.local/postgresdb restart"
alias pgstatus="pg_ctl -D ~/.local/postgresdb status"
