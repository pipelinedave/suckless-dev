.PHONY: all dwm dmenu st install

all: dwm dmenu st

dwm:
	cd dwm && sudo make clean install

dmenu:
	cd dmenu && sudo make clean install

st:
	cd st && sudo make clean install

DM_TYPE := $(shell ps -e | grep -Eo 'gdm|sddm' | uniq)

install:
ifeq ($(DM_TYPE),gdm)
	sudo cp ./usr/share/xsessions/dwm.desktop /usr/share/xsessions/
else ifeq ($(DM_TYPE),sddm)
	sudo cp ./usr/share/xsessions/dwm-sddm.desktop /usr/share/sddm/scripts/Xsession/
else
	$(error "Could not detect DM_TYPE. Are you using GDM or SDDM?")
endif
	sudo cp ./home/user/.scripts/kickoff-dwm.sh /home/$(SUDO_USER)/.scripts/
	sudo chown $(SUDO_USER):$(SUDO_USER) /home/$(SUDO_USER)/.scripts/kickoff-dwm.sh

