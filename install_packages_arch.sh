sudo pacman -S --noconfirm --needed zsh-syntax-highlighting tmux python-dev ncurses

sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5

mv .tmux/ .vim/ .tmux.conf .tmux.conf.local .vimrc .zshrc -t ~

mkdir ~/.vim/backups
mkdir ~/.vim/swaps
mkdir ~/.vim/undos

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"