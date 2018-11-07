# Git credentials
GIT_AUTHOR_NAME="Michael Ball"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
echo 'Please Enter the email address to use with git.'
read GIT_EMAIL
git config --global user.email "$GIT_EMAIL"