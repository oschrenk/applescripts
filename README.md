# README #

## Open In TextMate.app ##

Toolbar script by [Henryk Nyh](http://henrik.nyh.se), based on work by [Simon Dorfman](http://snippets.dzone.com/posts/show/1037)

> Clicking the toolbar icon now opens the selected file or files if there is a selection; otherwise it opens the current directory. You can also drag-and-drop files to the icon to open those.

Behind the scenes, the script is all AppleScript, without dropping into the shell. Feels a bit more robust.

A single TextMate window will open, containing all selected or dropped items in a project.

### Installation ###

Copy the `.app` somewhere (I keep it along side other scripts in `~/Library/Scripts`), then drag it onto the Finder toolbar.

### Icon ###

The default icon has been replaced with an icon matching Snow Leopard's style. It was available via the original blog post.

## Open In Terminal.app ##

[Enhanced Open Terminal](http://maururu.net/2007/enhanced-open-terminal-here-for-leopard/)
- ⌘ + Clicking opens a new tab in the frontmost Terminal instead of opening a new window
- ⌥ + Clicking runs the cd command in the frontmost Terminal window if it is not busy. Otherwise it opens a new window/tab (depending on the state of ⌘)

Based on original script by [Marc Liyanage](http://www.entropy.ch)

### Installation ###

Copy the `.app` somewhere (I keep it along side other scripts in `/Applications/Scripts`), then drag it onto the Finder toolbar.

## Toogle Bluetooth (with Growl Support) ##

An apple script for toggling Bluetooth on/off. Very useful in connection with Quicksilver.

Orginal available [here](http://www.macosxhints.com/article.php?story=20070328181324855)

## Lock Screen ##

Locks the screen

Found [here](http://www.macosxtips.co.uk/index_files/run-applescripts-with-keyboard-shortcuts.html)

## Unmount local drives ##

Unmounts the local drives. You don't get a message though and it takes a few seconds.

## Switch to VPN

A template for connecting to a VPN.

## Switch to User ##

A template for fast user switching. 

- This script **MUST** be named `Switch to <User>.scpt`, where `<User>` is the name of the user to switch to.
- You must first make a password item (a.k.a. a key) for the other user's password using Keychain Access, and call it `<username>`, where `username` is the other user's name and with the description `User Login`. The script assumes that you make this key in your `login.keychain`, which is the default one.
- The first time you run this script, you will be prompted to allow Keychain Scripting to access the password of the key.
- This script requires `Enable access for assistive devices` to be enabled in the Universal Access system preference pane.