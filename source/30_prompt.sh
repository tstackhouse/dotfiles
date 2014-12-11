# Ensure we have colors
autoload -U colors && colors

PROMPT="
%D{%I:%M %p} [ %{$fg[magenta]%}%~%{$reset_color%} ]
%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[white]%}%m%{$reset_color%}
%{$fg[green]%}%!%{$reset_color%}$ "