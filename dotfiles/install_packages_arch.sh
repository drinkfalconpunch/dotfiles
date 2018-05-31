log_file=~/install_process_log.txt

sudo pacman -S --noconfirm --needed zsh
if type -p zsh > /dev/null; then
	echo "zsh installed" >> $log_file
else
	echo "zsh failed to install" >> $log_file
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo pacman -S --noconfirm --needed zsh-syntax-highlighting

sudo pacman -S --noconfirm --needed tmux
if type -p tmux > /dev/null; then
	echo "tmux installed" >> $log_file
else
	echo "tmux failed to install" >> $log_file
fi

sudo pacman -S --noconfirm --needed python-dev

echo "\n--Summary--\n"
cat $log_file
echo
rm $log_file