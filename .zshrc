# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"

source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh

# plugins=(
#     #zsh-nvm
#     virtualenv
#     git
#     bundler
#     dotenv
#     macos
#     #rake
#     #rbenv
#     ruby
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#     sudo
#     #zsh-apple-touchbar
#     autoswitch_virtualenv
#     autoupdate
# )

antigen bundle git
antigen bundle virtualenv
antigen bundle bundler
antigen bundle dotenv
antigen bundle macos
antigen bundle ruby
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sudo
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle autoupdate

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export UPDATE_ZSH_DAYS=30

eval "$(fnm env --use-on-cd)"

export PATH="/usr/local/opt/util-linux/bin:$PATH"
export PATH="/usr/local/opt/util-linux/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended"
export PATH="/usr/local/opt/ruby/bin:$PATH"
