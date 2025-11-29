# Dotfiles for NixOS

This repository contains some configurations for a developer's NixOS.

Since most projects do not offer a shell.nix or flake.nix or whatever
nix configurations, the dotfiles do install some tools globally
in order to provide basic __READ__ requirements.

## Usage

If you want to use this dotfiles, remember to modify
`./machine-dotfiles.nix` and `./extra-fs.nix` because they contains
some hardware configurations that wont work on any other machines.

