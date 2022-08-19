# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(git)

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Fafacxdxbxegedabagacad

# PROMPT STUFF
GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
RESET=$(tput sgr0);

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

function random_element {
  declare -a array=("$@")
  r=$((RANDOM % ${#array[@]}))
  printf "%s\n" "${array[$r]}"
}

# Default Prompt
setEmoji () {
  EMOJI="$*"
  DISPLAY_DIR='%~'
  DISPLAY_BRANCH='$(git_branch)'
  PROMPT="${YELLOW}${DISPLAY_DIR}"$'\n'"${GREEN}${DISPLAY_BRANCH}${RESET} ${EMOJI} $ ";
}

newRandomEmoji () {
  setEmoji "$(random_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 😄 🍰 🐑 😎 🏎 🤖 😇 😼 💪 🦄 🥓 🌮 🎉 💯 ⚛️ 🐠 🐳 🐿 🥳 🤩 🤯 🤠 👨‍💻 🦸‍ 🧝‍ 🧞‍ 🧙‍ 👨‍🚀 👨‍🔬 🕺 🦁 🐶 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐍 🐢 🐘 🐉 🦚 ✨ ☄️ ⚡️ 💥 💫 🧬 🔮 ⚗️ 🎊 🔭 ⚪️ 🔱)"
}

newRandomEmoji

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules package-lock.json && npm i && say NPM is done";

## yarn aliases
alias yar="yarn run";
alias yas="yarn run start";
alias yab="yarn run build";

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# zsh auto autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
