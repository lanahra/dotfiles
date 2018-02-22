alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -AFlh'
alias clip='xclip -sel clip'


# dockerfiles
alias elm='docker run -it --rm -v "$(pwd):/elm" -w "/elm" -p 8000:8000 elm'
