all: clean mkdir eject_disk empty_trash lock_screen switch_to_user toggle_bluetooth

clean:
	rm -rf build
mkdir:
	mkdir build
eject_disk:
	osacompile -o build/Eject\ Disks.scpt scripts/Eject\ Disks.applescript
empty_trash:
	osacompile -o build/Empty\ Trash.scpt scripts/Empty\ Trash.applescript
lock_screen:
	osacompile -o build/Lock\ Screen.scpt scripts/Lock\ Screen.applescript
USERS=$(shell dscl /Local/Default -list /Users UniqueID | awk '$$2 >= 500 { print $$1; }')
switch_to_user:
	for u in $(USERS) ; \
	do \
		osacompile -o build/Switch\ to\ $$u.scpt scripts/Switch\ to\ User.applescript ; \
	done
toggle_bluetooth:
	osacompile -o build/Toggle\ Bluetooth.scpt scripts/Toggle\ Bluetooth.applescript
install:
	mkdir -p ~/Library/Scripts/
	rsync -arvz --cvs-exclude --exclude=.git --exclude=sync --exclude=.DS_Store ./build/ ~/Library/Scripts/
