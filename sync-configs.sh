
echo 'Syncing .bash_profile'
stow -D bash_profile
stow bash_profile 

echo 'Syncing .tmux.conf'
stow -D tmux
stow tmux

echo 'Syncing .vimrc'
stow -D vim 
stow vim 

echo 'Syncing .zshrc'
stow -D zsh
stow zsh 

