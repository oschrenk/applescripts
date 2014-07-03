--This script MUST be named "Switch to <User>.scpt", where <User> is the name of the user to switch to.
--You must first make a password item (a.k.a. a key) for the other user's password using Keychain Access,
--and call it "<user>", where "<user>" is the other user's name.the field "Kind" must be  "User Login" (without quotes).
--The script assumes that you make this key in your login.keychain, which is the default one.
--The first time you run this script, you will be prompted to allow Keychain Scripting to access the password of the key.
--This script requires "Enable access for assistive devices" to be enabled in the Universal Access system preference pane.

set username to word -1 of my findReplace(".scpt", "", (path to me as text))

-- Invoke Fast User Switching. The `id -ur username` part gets the uid number that corresponds to the username and substitutes it at the end of the CGSession command
do shell script "/System/Library/CoreServices/'Menu Extras'/User.menu/Contents/Resources/CGSession -switchToUserID `id -ur " & username & "`"

-- Use universal access to enter the text and to click the button
tell application "System Events"
	repeat
		if (do shell script "stat -f %Su /dev/console") is username then exit repeat

		-- Get the password for the username
		try
			set pswd to (do shell script "security find-generic-password -g -s \"" & username & "\" -D \"User Login\" 2>&1 1>/dev/null | sed -e 's/password: \"//' -e 's/\"//'")
		on error
			exit repeat
		end try

		if exists window 1 of application process "SecurityAgent" then
			tell process "SecurityAgent" to set value of text field 1 of window 1 to pswd
			key code 36
			exit repeat
		else
			tell application "SecurityAgent" to quit
			do shell script "/System/Library/CoreServices/'Menu Extras'/User.menu/Contents/Resources/CGSession -switchToUserID `id -ur " & username & "`"
			exit repeat
		end if
	end repeat
end tell

on findReplace(findText, replaceText, sourceText)
	set ASTID to AppleScript's text item delimiters
	set AppleScript's text item delimiters to findText
	set sourceText to text items of sourceText
	set AppleScript's text item delimiters to replaceText
	set sourceText to sourceText as text
	set AppleScript's text item delimiters to ASTID
	return sourceText
end findReplace