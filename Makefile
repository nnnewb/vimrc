install: install-vim install-tmux install-zsh

uninstall: uninstall-vim uninstall-tmux uninstall-zsh

uninstall-vim:
	@rm -vf  $(HOME)/.vimrc
	@rm -vrf $(HOME)/.vim

uninstall-tmux:
	@rm -vf  $(HOME)/.tmux.conf
	@rm -vrf $(HOME)/.tmux-themepack

uninstall-zsh:
	@echo 'not implemented yet.'
	@echo
	@exit -1

install-zsh:
	@if [ -f ~/.zshrc ] || [ -d ~/.oh-my-zsh ]; then \
		echo '=============================================='; \
		echo 'To avoid accidently break your configuration, '; \
		echo 'you need backup and uninstall current .zshrc, '; \
		echo 'and .oh-my-zsh folder first.                  '; \
		echo '=============================================='; \
		echo ; \
		exit -1; \
	fi
	wget https://ghproxy.com/raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | REMOTE=https://ghproxy.com/github.com/ohmyzsh/ohmyzsh/ sh
	@zsh -c 'git clone https://ghproxy.com/github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
	@zsh -c 'git clone https://ghproxy.com/github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
	@sed -i 's/plugins=(/plugins=(zsh-syntax-highlighting zsh-autosuggestions /g' ~/.zshrc


install-vim:
	@if [ -f ~/.vimrc ]; then \
		echo '=============================================='; \
		echo 'To avoid accidently break your configuration, '; \
		echo 'you need backup and uninstall current .vimrc, '; \
		echo 'and .vim folder first.                        '; \
		echo '=============================================='; \
		echo ; \
		exit -1; \
	fi
	@ln -vsf $(shell pwd)/vimrc     $(HOME)/.vimrc
	@ln -vsf $(shell pwd)/vim/      $(HOME)/.vim

install-tmux:
	@if [ -f ~/.tmux.conf ]; then \
		echo '=============================================='; \
		echo 'To avoid accidently break your configuration, '; \
		echo 'you need backup and uninstall current .tmux.conf, '; \
		echo 'and .tmux-themepack folder first.             '; \
		echo '=============================================='; \
		echo ; \
		exit -1; \
	fi
	@ln -vsf $(shell pwd)/tmux.conf $(HOME)/.tmux.conf
	@if [ ! -d ~/.tmux-themepack ]; then \
		git clone https://ghproxy.com/github.com/jimeh/tmux-themepack.git ~/.tmux-themepack; \
	fi

