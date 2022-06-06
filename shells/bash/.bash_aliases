explorer="thunar"
textEditor="lvim"
codeEditor="lvim"
desktopLocation="~/Desktop/"
docsLocation="~/Documents/"
downloadsLocation="~/Downloads/"
projectsLocation="~/projects/"
uniLocation="~/Documents/uni/"

alias exp='$explorer . &'
alias note='$textEditor'
alias ..='cd ../'
alias ...='cd ../../'
alias desk='cd $desktopLocation'
alias docs='cd $docsLocation'
alias proj='cd $projectsLocation'
alias unsw-ssh='ssh -Y z5266273@login.cse.unsw.edu.au'
alias bashrc='$codeEditor ~/.bash_aliases'
alias uni='cd $uniLocation'
alias gfp='git fetch && git pull'
alias gp='git pull'
alias gs='git status'

# C++ Complile
compile() { 
    if [ $# -eq 1 ]
    then
            g++ -Wall -g $1;
    elif [ $# -eq 2 ]
    then
            g++ -Wall -g $1 -o $2;
    else
            echo "Usage: compile [file.cpp] [output]";
    fi
}

# Git add
ga() {
    if [ $# -eq 0 ]
    then
        git add .
    else
        git add $@
    fi
}

# Git commit
gc() {
    if [ $# -eq 1 ]
    then
        git commit -m "$1";
    else
        echo "Usage: gc \"commit message\"";
    fi
}
