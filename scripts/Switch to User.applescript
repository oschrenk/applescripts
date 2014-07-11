--This script MUST be named "Switch to <User>.scpt", where <User> is the name of the user to switch to.
--You must first make a password item (a.k.a. a key) for the other user's password using Keychain Access,
--and call it "<user>", where "<user>" is the other user's name.the field "Kind" must be  "User Login" (without quotes).
--The script assumes that you make this key in your login.keychain, which is the default one.
--The first time you run this script, you will be prompted to allow Keychain Scripting to access the password of the key.
--This script requires "Enable access for assistive devices" to be enabled in the Universal Access system preference pane.

set user_name     to word -1 of my findReplace(".scpt", "", (path to me as text))
set user_id       to do shell script "/usr/bin/id -u " & user_name
set user_password to (do shell script "security find-generic-password -g -s \"" & user_name & "\" -D \"User Login\" 2>&1 1>/dev/null | sed -e 's/password: \"//' -e 's/\"//'")

-- Use universal access to enter the text and to click the button
do shell script "/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID " & user_id
repeat
    try
        tell application "System Events"
            repeat until visible of process "SecurityAgent" is false
                set visible of process "SecurityAgent" to false
            end repeat
            tell process "SecurityAgent" to set value of text field 1 of window 1 to pswd
-           key code 36
        end tell
        exit repeat
    on error
        tell application "System Events"
        end tell
    end try
end repeat

on findReplace(findText, replaceText, sourceText)
	set ASTID to AppleScript's text item delimiters
	set AppleScript's text item delimiters to findText
	set sourceText to text items of sourceText
	set AppleScript's text item delimiters to replaceText
	set sourceText to sourceText as text
	set AppleScript's text item delimiters to ASTID
	return sourceText
end findReplace
