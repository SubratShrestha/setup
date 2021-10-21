alias exp='explorer.exe .'
alias notepad='notepad.exe'
alias ..='cd ../'
alias ...='cd ../../'
alias c='cd /mnt/c/'
alias d='cd /mnt/d/'
alias desk='cd /mnt/c/Users/subra/Desktop/'
alias docs='cd /mnt/c/Users/subra/Documents/'
alias win-proj='cd /mnt/d/Projects'
alias lin-proj='cd /home/subrat/projects'
alias unsw-ssh='ssh -Y z5266273@login.cse.unsw.edu.au'
alias bashrc='code /home/subrat/.bash_aliases'
alias uni='cd /mnt/d/College'
alias shortcuts='python3 /home/subrat/setup/sh.py'
alias scripts='cd /home/subrat/setup/'
alias nvim-config='nvim .config/nvim/init.vim'
alias gfp='git fetch && git pull'
alias gp='git pull'
alias gs='git status'
alias restart='exec bash'


# functions
course() { cd "/mnt/d/College/$1-Comp"; }
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

ga() {
    if [ $# -eq 0 ]
    then
        git add .
    else
        git add $@
    fi
}

gc() {
    if [ $# -eq 1 ]
    then
        git commit -m "$1";
    else
        echo "Usage: gc \"commit message\"";
    fi
}
