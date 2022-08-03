#!/bin sh
set -e

GITHUB_USERNAME="dantechristmasfb"

echo "[INSTALL] Ohmyzsh"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

echo "[INSTALL] Chezmoi"
export BINDIR=$HOME/.local/bin
sh -c "$(curl -fsLS chezmoi.io/get)"

echo "[SETUP] Chezmoi"
$BINDIR/chezmoi init $GITHUB_USERNAME

echo "[APPLY] apply dotfiles"
$BINDIR/chezmoi apply
