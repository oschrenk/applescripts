# README #

	git clone https://github.com/oschrenk/osxhelpers
	cd osxhelpers
	make
	# copies the compiled scripts to ~/Library/Scripts/
	make install

Installs the following scripts

- `Eject Disks`. Eject all mounted disks. 
- `Empty Trash`. Empty the trash.
- `Lock Screen`. Switch to login screen. Orginal script from [here](http://www.macosxtips.co.uk/index_files/run-applescripts-with-keyboard-shortcuts.html)
- `Switch to User`. A Template for fast user switching. This just rocks with Quicksilver. `Makefile` will generate an appropiate script for each user account. To use it:
	- Create a password item for the other user's password using Keychain Access, and call it `<username>`, where `<username>` is the other user's name and with the description `User Login`. The script assumes that you make this key in your `login.keychain`, which is the default one.
	- The first time you run this script, you will be prompted to allow Keychain Scripting to access the password of the key.
	- This script requires `Enable access for assistive devices` to be enabled in the Universal Access system preference pane.
- `Toggle Bluetooth`. Toggles bluetooth power state. Depends on [blueutil](https://github.com/toy/blueutil/) (`brew install blueutil`). Orginal script from [here](http://www.macosxhints.com/article.php?story=20070328181324855)

## Applications ##

This repository also contains some `.app`s for the Finder Toolbar. But as the
icons are not Retina ready they aren't installed by default.

### Open In TextMate.app ###

Toolbar script by [Henryk Nyh](http://henrik.nyh.se), based on work by [Simon Dorfman](http://snippets.dzone.com/posts/show/1037)

> Clicking the toolbar icon now opens the selected file or files if there is a selection; otherwise it opens the current directory. You can also drag-and-drop files to the icon to open those.

Behind the scenes, the script is all AppleScript, without dropping into the shell. Feels a bit more robust.

A single TextMate window will open, containing all selected or dropped items in a project.

#### Installation ####

Copy the `.app` somewhere (I keep it along side other scripts in `~/Library/Scripts`), then drag it onto the Finder toolbar.

#### Icon ####

The default icon has been replaced with an icon matching Snow Leopard's style. It was available via the original blog post.

### Open In Terminal.app ###

[Enhanced Open Terminal](http://maururu.net/2007/enhanced-open-terminal-here-for-leopard/)
- ⌘ + Clicking opens a new tab in the frontmost Terminal instead of opening a new window
- ⌥ + Clicking runs the cd command in the frontmost Terminal window if it is not busy. Otherwise it opens a new window/tab (depending on the state of ⌘)

Based on original script by [Marc Liyanage](http://www.entropy.ch)

#### Installation ####

Copy the `.app` somewhere (I keep it along side other scripts in `/Applications/Scripts`), then drag it onto the Finder toolbar.

## Problems ##

### Expected end of line, etc. but found “"”. (-2741) ###

When invoking `make`

	scripts/Eject Disks.applescript:17: error: Expected end of line, etc. but found “"”. (-2741)
	make: *** [eject_disk] Error 1

Open the script in AppleScript-Editor and a winow will pop up searching for
`GrowlHelperApp`. This application isn't listed, so click `Search...`, 
press `Cmd + G` and enter `/Library/PreferencePanes/Growl.prefPane/Contents/Resources` and choose `GrowlHelperApp.app`. You won't find the file via Search neither can you navigate in the Dialog.