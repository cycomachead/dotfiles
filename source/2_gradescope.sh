# This script contains some general docker utilites and
# some that are specific to working on the Gradescope app.

# Gradescope Docker Runner
function review_branch() {
    docker run --rm -it -p 3001:3000 \
        --entrypoint=/bin/bash gradescope/dev \
        -c "cd ~/gradescope-app; git fetch; git pull; .ci/review_branch.sh $1"
}

# More docker stuff because Docker is annoying.
alias dc=docker-compose
alias dc-ssh='docker-compose exec web bash'

function docker-quit() {
    test -z "$(docker ps -q 2>/dev/null)" && osascript -e 'quit app "Docker"'
}

function docker-start() {
    open --background -a Docker &&
      while ! docker system info > /dev/null 2>&1; do sleep 1; done
      echo 'Docker is ready...'
}

function docker-stop-all() {
    docker ps -q | xargs -L1 docker stop
}

function gs-docker() {
    docker-start && docker-sync start --daemon && dc up
}
