# Required for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Required for Go
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Required for Rust
export PATH=$PATH:$HOME/.cargo/bin
