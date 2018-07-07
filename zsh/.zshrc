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
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle bhilburn/powerlevel9k
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle b4b4r07/enhancd
antigen bundle hlissner/zsh-autopair


# Load the theme.
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
antigen theme bhilburn/powerlevel9k

# Tell Antigen that you're done.
antigen apply


alias sudo='sudo '
alias rm='rm -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias du='du -h'

