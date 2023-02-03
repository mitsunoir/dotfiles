# BSD -> GNU
path=(/opt/homebrew/opt/*/libexec/gnubin "${path[@]}")
manpath=(/opt/homebrew/opt/*/libexec/gnuman "${path[@]}")

alias vim=nvim
alias -g F='$(fzf -e -m)'
alias -g D='$(find . -type d | fzf -e)'
export PS1="%3~
> "

