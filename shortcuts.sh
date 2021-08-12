cat ~/.bash_aliases |\
sed 's/alias //' |\
column -s "=" -t