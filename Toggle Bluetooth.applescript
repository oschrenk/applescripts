property blueutilPath : "/usr/local/bin/blueutil"

if execBlueutil("status") ends with "off" then
	-- Toggle BT on
	execBlueutil("on")
	set btStatus to true
else
	-- Toggle BT off
	execBlueutil("off")
	set btStatus to false
end if

on execBlueutil(command)
	set res to do shell script blueutilPath & " " & command
	if res contains "Error" then
		display dialog res
		quit
	end if
	return res
end execBlueutil

tell application "GrowlHelperApp"
	-- Tell Growl we want to send a notification, use the BT icon
	register as application Â
		"Bluetooth AppleScript" all notifications {"Bluetooth Notification"} Â
		default notifications {"Bluetooth Notification"} Â
		icon of application "Bluetooth File Exchange"
	if btStatus is true then
		notify with name Â
			"Bluetooth Notification" title Â
			"Bluetooth status" description Â
			"Bluetooth is now ON." application name "Bluetooth AppleScript"
	else
		notify with name Â
			"Bluetooth Notification" title Â
			"Bluetooth status" description Â
			"Bluetooth is now OFF." application name "Bluetooth AppleScript"
	end if
end tell