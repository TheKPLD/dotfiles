
alias ls='ls -G'
alias ldapsearch='ldapsearch -LLLQ'
alias strace='dtruss'
alias md5sum='md5'
alias secho='stty echo'
alias rsync='rsync --exclude=".git*" --exclude="*.pyc"'
alias gitpushup='git push -u $(git remote | grep -m 1 upstream || echo origin) `git symbolic-ref --short HEAD`'
alias pip='pip2'
. ~/.temp_aliases

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/

