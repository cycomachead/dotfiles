# makes it so that webpack crashes a LOT LESS often
export NODE_OPTIONS="--max-old-space-size=4096 ${NODE_OPTIONS}"

# more detailed ls output
alias ll="ls -lh --color"

# overmind without storybook
alias omlite="overmind start -l rails,worker,guard,maildev,webpack"