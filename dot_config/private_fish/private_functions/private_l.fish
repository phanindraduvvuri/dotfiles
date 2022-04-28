function l --wraps='exa --colors=always --color-scale --group-directories-first -l' --description 'alias l exa --colors=always --color-scale --group-directories-first -l'
  exa --color=always --color-scale --group-directories-first -l $argv; 
end
