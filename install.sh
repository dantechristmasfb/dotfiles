#!/usr/bin/env bash
set -e

GITHUB_USERNAME="dantechristmasfb"

echo "[CONFIG] GitHub Email and Username"
git config --global user.email "joshuasullivan@meta.com"
git config --global user.name "Joshua Sullivan"

echo "[INSTALL] Ohmyzsh"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

echo "[INSTALL] Chezmoi"
export BINDIR=$HOME/.local/bin
sh -c "$(curl -fsLS chezmoi.io/get)"

echo "[SETUP] Chezmoi"
$BINDIR/chezmoi init $GITHUB_USERNAME

echo "[APPLY] apply dotfiles"
$BINDIR/chezmoi apply

