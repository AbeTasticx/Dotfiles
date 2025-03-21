export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Aliases

alias ll="ls -al"
alias zshrc="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias rdp='f() {mstsc.exe /v:$1};f'
alias open="wsl-open"
alias vim="nvim"

mkdircd() {
  mkdir -p "$1" && cd "$1"
}

cd() {
  builtin cd "$@" && ll
}


eval "$(starship init zsh)"
