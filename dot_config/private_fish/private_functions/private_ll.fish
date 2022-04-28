function ll --wraps=ls --wraps='exa --colors=always --color-scale --group-directories-first -al' --description 'alias ll exa --colors=always --color-scale --group-directories-first -al'
  exa --color=always --color-scale --group-directories-first -al $argv; 
end
