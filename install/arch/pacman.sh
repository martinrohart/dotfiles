#!/bin/bash

# install pacman packages

# packages to install
packages=(
  acpid          # monitor - battery
  htop           # monitor - processes

  neovim         # neovim
  python-neovim  # neovim
  python2-neovim # neovim

  shellcheck     # shell linter

  alsa-utils     # sound
  pulseadio      # sound
  pulseadio-alsa # sound

  rxvt-unicode   # terminal
  xterm          # terminal
  tmux           # terminal
  ranger         # terminal - file manager

  thunar         # file manager

  dunst          # notifications

  fzf            # utils
  ripgrep        # utils
  wget           # utils
  xsel           # utils - clipboard
  bc             # utils - used by base16 color
  maim           # utils - screenshots
  wmctrl         # utils - used by lemonbar, "interact with X"
  p7zip          # utils - 7zip

  xorg           # x
  xorg-server    # x
  xorg-twm       # x
  xorg-utils     # x
  xorg-xclock    # x
  xorg-xinit     # x
  xorg-xfontsel  # x - find X fonts
  xorg-xrdb      # x

  rofi           # program launcher
  feh            # wallpaper

  ttf-dejavu     # fonts
  freetype2      # fonts
  xorg-fonts     # x - fonts

  openntpd       # time

  stack          # haskell

  python         # python3
  python-pip     # python3

  avahi
  cronie
  dbus
  linux-header
)

vmboxpackages=(
  virtualbox-guest-dkms
  virtualbox-guest-utils
)

sudo pacman -S "${packages[@]}"

