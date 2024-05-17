#!/bin/bash

echo -e "Creating a symbolic link to bash-it themes directory"
sudo ln -s $HOME/.bash-it-themes/magiccube $HOME/.bash_it/themes/
sudo ln -s $HOME/.bash-it-themes/sushu $HOME/.bash_it/themes/
sudo ln -s $HOME/.bash-it-themes/new-sushu $HOME/.bash_it/themes/

echo -e "Creating a symbolic link to bash-it aliases directory"
sudo ln -s $HOME/.bash-it-aliases/magiccube.aliases.bash $HOME/.bash_it/aliases/
sudo ln -s $HOME/.bash-it-aliases/sushu.aliases.bash $HOME/.bash_it/aliases/
sudo ln -s $HOME/.bash-it-aliases/new-sushu.aliases.bash $HOME/.bash_it/aliases/
