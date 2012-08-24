(*

 Open Terminal Here
 
 A toolbar script for Mac OS X 10.3
 
 Written by Marc Liyanage

Found here
http://hohonuuli.blogspot.de/2007/11/applescript-for-open-terminal-here.html
 
 See http://www.apple.com/applescript/macosx/toolbar_scripts/ for
 more information about toolbar scripts.
 
 See http://www.entropy.ch/software/applescript/ for the latest
 version of this script.
 
 
 History:
 17-NOV-2007: Modified by Brian Schlining to open in a new Tab in a terminal window
 18-AUG-2004: Version 2.0 by Allan Marcus. uses posix path 
 30-OCT-2001: Version 1.0, adapted from one of the example toolbar scripts
 30-OCT-2001: Now handles embedded single quote characters in file names
 30-OCT-2001: Now handles folders on volumes other than the startup volume
 30-OCT-2001: Now handles click on icon in top-level (machine) window
 31-OCT-2001: Now displays a nicer terminal window title, courtesy of Alain Content
 11-NOV-2001: Now folders within application packages (.app directories) and has a new icon
 12-NOV-2001: New properties to set terminal columns and rows as the Terminal does not use default settings
 14-NOV-2001: Major change, now handles 8-bit characters in all shells, and quotes and spaces in tcsh
 18-NOV-2001: Version 1.1: Rewrite, now uses a temporary file  ~/.OpenTerminalHere to communicate
 the directory name between AppleScript and the shell because this is much more reliable for 8-bit characters
 
*)

property terminal_rows : 24
property terminal_columns : 90
property debug : true

-- when the toolbar script icon is clicked
--
on run
	tell application "Finder"
		activate
		try
			set this_folder to (the target of the front window) as alias
		on error
			set this_folder to startup disk
		end try
		my process_item(this_folder)
	end tell
end run

-- This handler processes folders dropped onto the toolbar script icon
--
on open these_items
	repeat with i from 1 to the count of these_items
		set this_item to item i of these_items
		my process_item(this_item)
	end repeat
end open

-- this subroutine processes does the actual work
--
on process_item(this_item)
	tell application "Terminal"
		activate
		tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
		do script with command "cd " & quoted form of POSIX path of this_item & ";clear" in selected tab of the front window
	end tell
end process_item