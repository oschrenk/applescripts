-- Eject all local disks

tell application "Finder"
	eject (every disk)
end tell

tell application "System Events"
	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
	tell application "GrowlHelperApp"
		set the allNotificationsList to {"Eject Disk Notification"}
		set the enabledNotificationsList to {"Eject Disk Notification"}

		register as application Â
			"Growl Eject Disk Notification" all notifications allNotificationsList Â
			default notifications enabledNotificationsList Â
			--       Send a Notification...
		notify with name Â
			"Eject Disk Notification" title Â
			"Eject Disk Notification" description Â
			"Ejected all disks." application name "Growl Eject Disk Notification" icon of application "Finder.app"
	end tell
end if
