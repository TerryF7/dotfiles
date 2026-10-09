# dotfiles

Terry Feng's dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Install

**1. Install developer tools**

Install Xcode from the App Store, or Command Line Tools:

```shell
xcode-select --install
```

**2. Install Homebrew**

Install from [brew.sh](https://brew.sh/).

**3. Install chezmoi and apply dotfiles**

```shell
brew install chezmoi
chezmoi init --apply https://github.com/TerryF7/dotfiles.git
```

**4. Restore the SSH private key, then apply permissions**

```shell
chezmoi apply
```
