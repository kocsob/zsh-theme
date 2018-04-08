~/.oh_my_zsh/custom/themes:
	mkdir -p ~/.oh-my-zsh/custom/themes

install: ~/.oh_my_zsh/custom/themes
	cp ./kocsob.zsh-theme ~/.oh-my-zsh/custom/themes/kocsob.zsh-theme
	sed -i.bak 's/^[[:space:]]*ZSH_THEME=.*/ZSH_THEME="kocsob"/' ~/.zshrc
