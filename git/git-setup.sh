#!/bin/bash

#setup inital git config stuff
# ask for git username
echo "Please input name for git user"

read -p "git user: " uservar

#ask for git user email
echo 'Please provide an email address'

read -p 'email address: ' emailvar

echo 'inputting git user information'

git config --global user.name $uservar
git config --global user.email $emailvar

echo 'basic Git setup complete'
echo 'You may now begin commiting! Enjoy!'