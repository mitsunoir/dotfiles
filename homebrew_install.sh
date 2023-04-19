#!/usr/bin/env bash

echo "Installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "Run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "Run brew upgrade..."
brew upgrade --all

formulas=(
    binutils
    cmatrix
    coreutils
    diffutils
    direnv
    docker
    docker-compose
    exa
    fd
    findutils
    fzf
    gawk
    git
    gnu-sed
    gnu-tar
    gnu-which
    gzip
    haskell-stack
    jq
    lima
    neovim
    pyenv
    qemu
    ripgrep
    tmux
    wget
    zstd
)

echo "Start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    alacritty
)

echo "Start brew install --cask apps..."
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup
brew cask cleanup

cat << END

=====================
HOMEBREW INSTALLED !!
=====================

END
