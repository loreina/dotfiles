cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

function zsh() {
	# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
	rm -rf $HOME/.zshrc
	ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
}

function hyper() {
	# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
	rm -rf $HOME/.hyper.js
	ln -s $HOME/.dotfiles/.hyper.js $HOME/.hyper.js
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
	zsh;
	hyper;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
		zsh;
	fi;
fi;

unset doIt;
unset zsh;
unset hyper;
