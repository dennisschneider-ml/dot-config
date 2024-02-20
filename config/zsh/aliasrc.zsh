# Zsh-specific aliasrc

# install and log pacman-packages
inst() {
	sudo pacman -Syu $@ & echo $@ | tr " " "\n" >> "$XDG_DATA_HOME/install.log"
}

# mass rename all files by replacing spaces with underscores
mrn() {
	changes=$(ls -1 | awk '/ /{
	printf("mv ")
	gsub(" ", "\\ "); printf($0 " ")
	gsub("\\\\ ", "_"); print($0 " &")
	}')
	echo $changes
	echo "Apply changes? (y/n)"
	read answer
	if [ "$answer" != "${answer#[Yy]}" ]; then
		eval $(echo $changes | sed 's/^[^mv]*mv/mv/') | echo "Successfully applied."
	fi
}

# source the shell-independent aliasrc
source $XDG_CONFIG_HOME/shell/aliasrc
