source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle debian
antigen bundle sudo
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle wting/autojump
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle bhilburn/powerlevel9k
antigen bindle zsh-users/zsh-autosuggestions
# Load the theme.
POWERLEVEL9K_MODE=nerdfont-complete
antigen theme bhilburn/powerlevel9k

# Tell Antigen that you're done.
antigen apply

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

alias sudo='sudo '
alias rm='rm -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias du='du -h'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
