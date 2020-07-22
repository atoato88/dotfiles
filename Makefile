.PHONY: install clean

install:
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	ln -s ${PWD}/.config/nvim ${HOME}/.config/

#clean:
#	rm ${HOME}/.vimrc
#	rm -rf ${HOME}/.config/nvim

