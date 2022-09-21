# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

my_cyan="\[\e[1m\e[38;5;44m\]"
my_purple="\[\e[38;5;104m\]"

SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
SCM_THEME_PROMPT_PREFIX=" ${green?}|"
SCM_THEME_PROMPT_SUFFIX="${green?}|"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${cyan?}| "
GIT_THEME_PROMPT_SUFFIX=" ${cyan?}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_FORMAT:="%d %b %y %H:%M:%S"}"

function sushu_clock() {
	printf '%s' "$(clock_prompt)"
}

function sushu_prompt_command() {
    PS1="\n${cyan}$(sushu_clock) "
	PS1+="${blue}\u @ \h "
	PS1+="${purple}\w"
    PS1+="\n${bold_cyan?}$(scm_prompt_char_info) "
	PS1+="${cyan}→${reset_color} "
}

safe_append_prompt_command sushu_prompt_command
