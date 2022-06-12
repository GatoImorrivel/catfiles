function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

local git_info='$(git_prompt_info)'

PROMPT="${FG[239]}┌%B%{$fg[red]%}%n ${FG[239]}at %B${FG[109]}$(box_name) ${FG[239]}in %B${FG[113]}%~%b${git_info}
${FG[239]}└%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[239]}on%{$reset_color%} %B${FG[134]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[134]}*"
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[134]}"

