if status is-interactive
    # Commands to run in interactive sessions can go here

    # Expand .fish_aliases if it exists
    if [ -f /home/subrat/.config/fish/.fish_aliases ]
        . /home/subrat/.config/fish/.fish_aliases
    end

    # Set the posh theme
    oh-my-posh --init --shell fish --config '/home/subrat/posh-themes/.mytheme.omp.json' | source

     
    # Run TMUX on startup. Make sure TMUX exists, we're in interactive shell, and we're not running TMUX within itself.
    if command -v tmux &> /dev/null && [ "$TERM" != screen ] && [ "$TERM" != tmux ] && [ -z "$TMUX" ]
      exec tmux
    end
end
