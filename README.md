# dotfiles

These are my dotfiles I've used in some form over the last 10+ years.

## Prerequisites

- [iTerm2](http://www.iterm2.com/)
- [homebrew](http://brew.sh/)

## Setup

- Install [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) tap and run `brew bundle` to install packages required
- After all packages are installed, change your login shell to the homebrew installed version of zsh `/usr/local/bin/zsh`

### Base16/24 Colours

I use the [tinty](https://github.com/tinted-theming/tinty) to set the themes across the shell, tmux and neovim.

If you wish to use a different colour, just run `tinty apply THEME` and this will persist across shell sessions.

## License

(The MIT License)

Copyright (c) 2023 Christopher Chow

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
