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
	register as application �
		"Bluetooth AppleScript" all notifications {"Bluetooth Notification"} �
		default notifications {"Bluetooth Notification"} �
		icon of application "Bluetooth File Exchange"
	if btStatus is true then
		notify with name �
			"Bluetooth Notification" title �
			"Bluetooth status" description �
			"Bluetooth is now ON." application name "Bluetooth AppleScript"
	else
		notify with name �
			"Bluetooth Notification" title �
			"Bluetooth status" description �
			"Bluetooth is now OFF." application name "Bluetooth AppleScript"
	end if
end tell