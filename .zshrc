# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

exists() {
    # If command or file exists
    if [ -x "$(command -v $1)" ] || [ -e "$1" ]; then
        return
    fi
    return 1
}


precmd() {
    precmd() {
        echo
    }
}
exists starship && eval "$(starship init zsh)"
exists fnm && eval "$(fnm env)"

eval "$(atuin init zsh --disable-up-arrow)"
