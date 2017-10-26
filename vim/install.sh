#!/bin/bash

mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/ftdetect

curl -o- -L https://raw.githubusercontent.com/c3m3gyanesh/p4-syntax-highlighter-collection/master/vim/ftdetect/p4.vim > ~/.vim/ftdetect/p4.vim
curl -o- -L https://raw.githubusercontent.com/c3m3gyanesh/p4-syntax-highlighter-collection/master/vim/syntax/p4.vim > ~/.vim/syntax/p4.vim
