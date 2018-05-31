log_file=~/install_process_log.txt

sudo pacman -S --no-confirm zsh
if type -p zsh > /dev/null; then
	echo "zsh installed" >> $log_file
else
	echo "zsh failed to install" >> $log_file
fi

sudo pacman -S --no-confirm zsh-syntax-highlighting

sudo pacman -S --no-confirm tmux
if type -p tmux > /dev/null; then
	echo "tmux installed" >> $log_file
else
	echo "tmux failed to install" >> $log_file
fi

sudo pacman -S --no-confirm python-dev

echo "\n--Summary--\n"
cat $log_file
echo
rm $log_file