-- Eject all local diskstell application "Finder"	eject (every disk)end telltell application "System Events"	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0end tellif isRunning then	tell application id "com.Growl.GrowlHelperApp"		set the allNotificationsList to {"Eject Disk Notification"}		set the enabledNotificationsList to {"Eject Disk Notification"}		register as application ¬			"Growl Eject Disk Notification" all notifications allNotificationsList ¬			default notifications enabledNotificationsList ¬			--       Send a Notification...		notify with name ¬			"Eject Disk Notification" title ¬			"Eject Disk Notification" description ¬			"Ejected all disks." application name "Growl Eject Disk Notification" icon of application "Finder.app"	end tellend if