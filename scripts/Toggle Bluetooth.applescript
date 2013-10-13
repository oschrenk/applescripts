property blueutilPath : "/usr/local/bin/blueutil power"

if execBlueutil("") ends with "0" then
	-- Toggle BT on
	execBlueutil("1")
	set btStatus to true
else
	-- Toggle BT off
	execBlueutil("0")
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