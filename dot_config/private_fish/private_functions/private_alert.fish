function alert --wraps='notify-send --urgency low -i ([ 2 = 0 ] && echo terminal || echo error) (history -n1)' --description 'alias alert notify-send --urgency low -i ([ 2 = 0 ] && echo terminal || echo error) (history -n1)'
  notify-send --urgency low -i ([ 2 = 0 ] && echo terminal || echo error) (history -n1) "Execution Complete" $argv; 
end
