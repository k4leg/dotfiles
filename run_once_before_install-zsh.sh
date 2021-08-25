#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2021 k4leg <python.bogdan@gmail.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

GITHUB_API=https://api.github.com

function get_powerlevel10k_latest_version {
    local repo=romkatv/powerlevel10k
    local response="$(curl -s "$GITHUB_API"/repos/"$repo"/releases/latest)"
    jq -r .tag_name <<< "$response"
}

if [ ! -d ~/.oh-my-zsh ]; then
    umask g-w,o-w
    git clone -c core.eol=lf -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore --depth 1 --branch master \
        https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone --depth 1 -b "$(get_powerlevel10k_latest_version)" \
        https://github.com/romkatv/powerlevel10k.git \
        ~/.oh-my-zsh/custom/themes/powerlevel10k
fi
