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

install-fnm:
	curl -fsSL https://fnm.vercel.app/install | sed 's/github\.com/ghproxy.com\/github.com/g' | bash

install-docker-debian:
	sudo apt-get remove -y docker docker-engine docker.io containerd runc || true
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian $$(lsb_release -cs) stable" \
		| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce

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

