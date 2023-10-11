.PHONY: all dwm dmenu st install

all: dwm dmenu st

dwm:
	cd dwm && sudo make clean install

dmenu:
	cd dmenu && sudo make clean install

st:
	cd st && sudo make clean install

install: all
	sudo cp ./usr/share/xsessions/dwm.desktop /usr/share/xsessions/
	sudo cp ./home/user/.scripts/kickoff-dwm.sh /home/$(SUDO_USER)/.scripts/
	sudo chown $(SUDO_USER):$(SUDO_USER) /home/$(SUDO_USER)/.scripts/kickoff-dwm.sh
