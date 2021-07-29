#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2021 k4leg <python.bogdan@gmail.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

PATH_TO_VIM_PLUG=~/.local/share/nvim/site/autoload/plug.vim
if [ ! -e "$PATH_TO_VIM_PLUG" ]; then
    curl -fLo "$PATH_TO_VIM_PLUG" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [ ! -d ~/.config/nvim/plugged ]; then
    nvim -c 'PlugInstall | qall!'
fi
