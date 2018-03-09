# Dotfiles

My OSX / Ubuntu / WSL dotfiles.

## About this project

I've been using bash for a long time, and had been managing all of my terminal configurations via a custom script that I kept (along with the configs) in a private git repo over on [BitBucket](http://www.bitbucket.org/).  It worked well enough, but since it was in a private repository, I couldn't share my configs with others, mainly because I had bits of private info sprinked all over my configs, server aliases, ssh commands, just a lot of stuff that isn't fit for public comsumption

## Enter `dotfiles`

I switched over to this configuration management setup after finally getting fed up with my shared-history configuation in bash (which I had never managed to get to work quite right) and deciding to jump ship for zsh.  Since I was going to be starting over again anyway for my shell config, I decided to start transitioning to a better management setup for all my dotfiles.

## Differences from Cowboy's version

* Use zsh by default instead of bash
* Remove all setup for vim (proper emacs config setup forthcoming)
* Added a 'link-private' function for private stuff like .ssh and GPG keys to be synced in a non-public fashion (e.g. Dropbox, Google Drive, rsync, etc.) (inspired by [Ted Kulp's take on Cowboy's setup](https://github.com/tedkulp/dotfiles))
* Includes 'zsh-git-prompt' to provide relevant git status information in real time
* By default, any shell will automatically spawn (or connect to an existing) tmux session
* Install [Oh My Zsh](http://ohmyz.sh/) for it's array of plugins and (especially) git completion

## TO DO

* Import VSCode config & a cask install (gist-based config sync plugin is available)
* Import irssi configuation
* Import gitk configuration
* Convert to GPL License
* Remove additional unneeded/unused packages
* Potentially auto-update on login
* Import [utils](https://github.com/tstackhouse/utils) as a submodule and incorporate
* Add support to install dropbox automagically on ubuntu (Is there already a cask for mac?)

## Init Scripts

### OS X

* Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script
* Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script
* Homebrew recipes via the [init/30_osx_homebrew_recipes.sh](init/30_osx_homebrew_recipes.sh) script
* Homebrew casks via the [init/30_osx_homebrew_casks.sh](init/30_osx_homebrew_casks.sh) script
* [Fonts](/cowboy/dotfiles/tree/master/conf/osx/fonts) via the [init/50_osx_fonts.sh](init/50_osx_fonts.sh) script

### Ubuntu

* APT packages and git-extras via the [init/20_ubuntu_apt.sh](init/20_ubuntu_apt.sh) script

### WSL

* APT packages and git-extras via the [init/20_wsl_apt.sh](init/20_wsl_apt.sh) script

### All 3

* Node.js and npm using nvm via the [init/50_node.sh](init/50_node.sh) script

## Installation

### OS X Notes

I've isntalled this on OS x 10.8 without any issues, after having homebrew installed already

### Ubuntu Notes

I've set this up on a box running the latest Ubuntu (14.10 Utopic Unicorn) and made some appropriate tweaks to make things run smoothly there

## Inspiration
<https://github.com/cowboy/dotfiles>
<https://github.com/tedkulp/dotfiles>
(random stuff that I've had kicking around since college)

## License
Copyright (c) 2014 Tim Stackhouse
Licensed under the MIT license.
<http://benalman.com/about/license/>
