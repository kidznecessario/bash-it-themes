# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

my_cyan="\[\e[1m\e[38;5;44m\]"
my_purple="\[\e[38;5;104m\]"
my_red="\[\e[38;5;198m\]"

SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${cyan?}| "
GIT_THEME_PROMPT_SUFFIX=" ${cyan?}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_FORMAT:="%d %b %y %H:%M:%S"}"

function sushu_clock() {
	printf "%s" "$(clock_prompt)"
}

function sushu_right_align() {
	printf "%*s" $COLUMNS "$1 > $2"
}

function sushu_prompt_command() {
    PS1="\n${my_red}\[$(tput sc; sushu_right_align "$(k8s_context_prompt)" "$(k8s_namespace_prompt)"; tput rc)\]"
    PS1+="$(sushu_clock) "
	PS1+="${blue}\u @ \h "
	PS1+="${purple}\w\n"
	PS1+="${cyan}$(python_version_prompt) | "
	PS1+="${cyan?}$(scm_prompt_char_info) "
	PS1+="${cyan}→${reset_color} "
}

safe_append_prompt_command sushu_prompt_command
