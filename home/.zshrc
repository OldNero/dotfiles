# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Current theme
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/oldnero/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# My plugins
plugins=(zsh-autosuggestions alias-maker you-should-use fast-syntax-highlighting)

alias sysup="sudo pacman -Syyu"
alias pac="sudo pacman -Syu"
alias unpac="sudo pacman -Rns"
alias pacls="(pacman -Q | cut -d' ' -f1)"

alias flatls="flatpak list --app --columns=application"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias pwal="wal -i ~/.local/share/backgrounds/*.*g && pywalfox update"
alias ed="micro"
alias zj="zellij"
alias fast-mir="rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrors-list"
alias search="sudo updatedb && locate"
alias src="source"
alias bright="ddcutil setvcp 10 --bus 1"
alias ds4="~/Scripts/ds4connect.sh"
alias tj="tjournal"
alias wm="loginctl show-session `loginctl | sed -n 2p | awk '{print $1}'` -p Type"
alias fetch="fastfetch"
alias update-mirror='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && yay -Syyu --noconfirm'

# Created by `pipx` on 2024-03-21 01:15:19
export PATH="$PATH:/home/oldnero/.local/bin"

if [ -e /home/oldnero/.nix-profile/etc/profile.d/nix.sh ]; then . /home/oldnero/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
