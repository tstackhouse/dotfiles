# Ensure we have colors
autoload -U colors && colors

local git_status='$(git_super_status)'

PROMPT="
%D{%I:%M %p} [ %{$fg[magenta]%}%~%{$reset_color%} ]
%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[white]%}%m%{$reset_color%} ${git_status}
%{$fg[green]%}%!%{$reset_color%}$ "