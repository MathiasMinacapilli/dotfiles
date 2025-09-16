# Dot files

This repo is intended to share my dot files (and for me to reuse them between computers)

# Pre-requirements

- Install zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- Install ohmyzsh
- Install node
- Install docker (https://docs.docker.com/engine/install/debian/#install-using-the-repository)
    - https://gist.github.com/mykubicle/9067cdacff99c00e47933d40e595db90
 
# Getting started

First of all, install `stow` package, used to copy dot files from "dotfiles" folder to
home directory (creating sym links).

1. Clone this repo under home (should be `$HOME/dotfiles`)
1. Inside this repo run script `sh sync-configs.sh`
1. Run inside of VIM to install plugins: `:PlugInstall`

# Extra tools

## nvm in zsh
https://github.com/lukechilds/zsh-nvm#manually
