function ls --wraps='exa --color=always --color-scale --group-directories-first' --description 'alias ls exa --color=always --color-scale --group-directories-first'
  exa --color=always --color-scale --group-directories-first $argv; 
end
