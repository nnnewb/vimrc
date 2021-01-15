uninstall:
	@rm -vf  $(HOME)/.vimrc
	@rm -vrf $(HOME)/.vim
	@rm -vf  $(HOME)/.tmux.conf
	@rm -vrf $(HOME)/.tmux-themepack

install:
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
		git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack; \
	fi

