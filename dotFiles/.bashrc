# memo for the diff files
# exe /etc/profile
# if /home/arkadefr_profile exists
#   exe /home/arkadefr_profile
# else
#   if /home/arkadefr_login
#   else
#       if ~/.profile

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export LD_LIBRARY_PATH="$(eval echo ~/lib/)"

# terminal options
stty werase ^@
# disable the wall message
mesg n

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /home/arkadefr/.bash_function ]; then
	. /home/arkadefr/.bash_function
    bash_log "OK" "load bash_function"
else
    echo "!problem while loading the bash_function!"
    return
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
	bash_log "OK" "load bash_completion"
fi

if [ -f /home/arkadefr/.shell_options ]; then
	. /home/arkadefr/.shell_options
	bash_log "OK" "load shell_options"
fi

if [ -f /home/arkadefr/.bash_variables ]; then
	. /home/arkadefr/.bash_variables
	bash_log "OK" "load bash_variables"
fi

if [ -f /home/arkadefr/.bash_aliases ]; then
	. /home/arkadefr/.bash_aliases
	bash_log "OK" "load bash_aliases"
fi

if [ -f $(eval echo "~/.local_bash.sh") ]; then
	. ~/.local_bash.sh
	bash_log "OK" "load local_bash.sh"
fi

export PROMPT_COMMAND='history -a; history -c; history -r;'

if [ -f /etc/bash_completion.d/git ]; then
    source /etc/bash_completion.d/git
else
    source /etc/bash_completion.d/git-prompt
fi
PS1="[\[\033[32m\]\w\[\033[0m\]] \$(__git_ps1)\n\[\033[0m\]\u@\H$ \[\033[0m\]"
bash_log "OK" "setting up all the prompts"

# environment of bash
export EDITOR=vim

d=~/.dircolors
test -r $d && eval "$(dircolors $d)"
