log_file=~/install_process_log.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
	echo "zsh installed" >> $log_file
else
	echo "zsh failed to install" >> $log_file
fi

sudo apt-get -y install zsh-syntax-highlighting

sudo apt-get -y install tmux
if type -p tmux > /dev/null; then
	echo "tmux installed" >> $log_file
else
	echo "tmux failed to install" >> $log_file
fi

sudo apt-get -y install python-dev

echo -e "\n--Summary--\n"
cat $log_file
echo
rm $log_file