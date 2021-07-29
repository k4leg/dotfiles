#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2021 k4leg <python.bogdan@gmail.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

if [ ! -d ~/.oh-my-zsh ]; then
    umask g-w,o-w
    git clone -c core.eol=lf -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore --depth 1 --branch master \
        https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    ln -s /usr/share/zsh-theme-powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k
fi
