# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
SCM_THEME_PROMPT_PREFIX=" ${green?}|"
SCM_THEME_PROMPT_SUFFIX="${green?}|"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${cyan?}| "
GIT_THEME_PROMPT_SUFFIX="${cyan?} |"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_FORMAT:="%d %b %y %H:%M:%S"}"

function sushu_clock() {
	printf '%s' "$(clock_prompt) "
}

function sushu_prompt_command() {
	PS1="${cyan?}╭─"
    PS1+="\n$(battery_char) \[\e[15m$(sushu_clock)${reset_color?}~ "
	PS1+="${normal}\[\e[1m\e[38;5;44m\]\u ${reset_color}"
	PS1+="${normal}\[\e[38;5;104m\]\w\n${reset_color?}"
	PS1+="${cyan}╰─ \$ ${normal}"
    PS1+="${bold_cyan?}$(scm_prompt_char_info) "
	PS1+="${cyan?}→${reset_color?}${BOLD} "
}


safe_append_prompt_command sushu_prompt_command

