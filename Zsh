# awesome-fontconfig
POWERLEVEL9K_MODE='awesome-fontconfig'

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
#POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=""
#POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=" "
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_name dir vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_HIDE_BRANCH_ICON=true
POWERLEVEL9K_HOME_ICON=" "
POWERLEVEL9K_FOLDER_ICON=" "
POWERLEVEL9K_HOME_SUB_ICON=" "
POWERLEVEL9K_CUSTOM_NAME="echo AP"

# set histfile
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# alias
alias sudo="sudo "
alias gp="git push origin master"
