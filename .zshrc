# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case >
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Color>
zstyle ':completion:*' rehash true                              # autom>
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#History stuff
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500


setopt autocd extendedglob notify histignorealldups correct 
unsetopt beep nomatch



## Keybindings
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

##Aliases
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias gitu='git add . && git commit && git push'

# substitution for prompt
#setopt prompt_subst


# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gustavo/.zshrc'

autoload -U compinit colors zcalc
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d
colors
_comp_options+=(globdots)	
# End of lines added by compinstall


autoload -Uz promptinit
promptinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
zmodload zsh/terminfo
# Autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh                
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20                
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#PL10K
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
