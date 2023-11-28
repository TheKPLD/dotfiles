include(){
    if [[ -f $1 ]]
    then
        source $1
    else
        touch $1
    fi
}

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH:$HOME/go/bin";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

alias ls='ls -G'
alias ldapsearch='ldapsearch -LLLQ'
if ! which strace >>/dev/null && which dtruss >>/dev/null
then
    alias strace='dtruss'
fi
if ! which md5sum >>/dev/null && which md5 >>/dev/null
then
    alias md5sum='md5'
fi
alias secho='stty echo'
alias rsync='rsync --exclude=".git*" --exclude="*.pyc"'
alias gitpushup='git push -u origin `git symbolic-ref --short HEAD`'
ssh-add -A 2>>/dev/null

eval "$(/opt/homebrew/bin/brew shellenv)"
include ~/.profile
include ~/.bashrc_local

if [[ -d "$HOME/.rvm/bin" ]]
then
    export PATH="$PATH:$HOME/.rvm/bin"
fi
