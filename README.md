# philipjting/vimrc

My personal vimrc setup

Tested on:

* macOS Sierra 10.12.5
* iTerm2 Build 3.0.15
* VIM - Vi IMproved 8.0

## Developer Profile

* Front-End JavaScript Developer (JavaScript)
* Uses Vim in iTerm with terminal shell
* Prefers different color scheme between shell context and Vim context
* Prefers light theme over dark for text editor
* Switches between different coding standards for different projects
  (e.g. tabs vs. spaces, 2/4 spaces per tab)

## Design and Motivation

* This was originally a copy of the original vimrc under [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles).
  Conventional wisdom states that it is often best to follow the brightest or
  wisest minds, even if blindly, until you understand specifically why you want
  to go on your own path.
* I am primarily a front-end JavaScript developer, so I removed all the items
  pertaining to Rails and Ruby.
* I have included switching between tabs and spaces, as well as number of
  spaces in each tab.  This is important when working with different
  repositories with different coding standards.
* Thoughtbot uses their own in house plugin manager.  I switched over to
  [vim-plug](https://github.com/junegunn/vim-plug) for the sake of simplicity.
* I use iTerm with terminal shell, so I often get confused which context I am in
  (either shell or Vim) when I switch between tabs.  I use the default iTerm
  dark theme, and Vim uses a light theme.  I stare at the editor a lot more than
  the shell, and light themes have [more readability](http://www.sciencedirect.com/science/article/pii/0141938281900950), despite being [less popular](http://vimcolors.com/).

## Plugins

* flazz/vim-colorschemes - Giant colorscheme pack
* godlygeek/csapprox - Fixes colorschemes for terminal shell Vim
* ctrlpvim/ctrp.vim - Fuzzy file finder
* Raimondi/delimitMate - Auto-completion for quotes, parens, brackets, etc.
* scrooloose/nerdcommenter - Commenting plugin
* vim-airline/vim-airline - Status and tabline for vim
* haya14busa/incsearch.vim - Searching while you type

## Functions

* \<Leader\>p - Set paste, so that pasting doesn't automatically indent.
* \<Leader\>i - Indent all lines.
* \<Leader\>n - Toggle between relative line numbers or regular line numbers.
* \<Leader\>h - Toggle highlighting. Searching automatically turns it back on.
* \<Leader\>t - Set indentation to tabs.
* \<Leader\>t - Set indentation to spaces.
* \<Leader\>2 - Set tab width to 2 spaces.
* \<Leader\>4 - Set tab width to 4 spaces.

