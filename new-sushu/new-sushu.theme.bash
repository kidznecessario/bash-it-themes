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
	printf "%s" "$(date +"%Y %d %b %T")"
}

function sushu_python() {
	if python_version_prompt &>/dev/null; then
		printf "$(python3 --version) | "
	fi
}

function sushu_kubernetes() {
	if k8s_context_prompt &>/dev/null; then
		printf "%s" "$(k8s_context_prompt) > $(k8s_namespace_prompt)"
	fi
}

function sushu_prompt_command() {
    PS1="\n$(sushu_clock) "
	PS1+="${purple}\u @ \h "
	PS1+="${my_red}\w\n"
	PS1+="${cyan}$(sushu_python)"
	PS1+="${cyan?}$(scm_prompt_char_info) "
	PS1+="${cyan?}$(sushu_kubernetes)\n"
	PS1+="${cyan}→${reset_color} "
}

safe_append_prompt_command sushu_prompt_command
