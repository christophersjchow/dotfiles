#!/bin/bash

if [[ $1 == 'link' ]]; then
    for f in $PWD/*
    do
        if [[ $f == '.git' || ${f##*.} == 'sh' || ${f##*.} == 'md' ]]; then
            continue;
        else
            ln -fs "$f" "$HOME/.${f##*/}"
        fi
    done
elif [[ $1 == 'unlink' ]]; then
    for f in $PWD/*
    do
        if [[ $f == '.git' || ${f##*.} == 'sh' || ${f##*.} == 'md' ]]; then
            continue;
        else
            unlink "$HOME/.${f##*/}"
        fi
    done
else
    echo "usage: dotfiles.sh [link|unlink]";
fi
