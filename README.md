# dotfiles

These are my dotfiles I've used in some form over the last 10+ years.

## Prequisites

- [iTerm2](http://www.iterm2.com/)
- [homebrew](http://brew.sh/)

## Setup

- Install [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) tap and run `brew bundle` to install packages required
- After all packages are installed, change your login shell to the homebrew installed version of zsh `/usr/local/bin/zsh`

### Base16 Colours

I use the [base16](https://github.com/tinted-theming/base16-shell) scripts to set the theme across the shell, tmux and neovim.
Make sure to load the iTerm2 colour preset from the [base16-iterm2](https://github.com/tinted-theming/base16-iterm2/tree/0515228b68481627124253d56ba75e812bbb57d7) submodule.

If you wish to use a different colour, simply change the `BASE16_THEME` in `~/.zshrc`.

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
