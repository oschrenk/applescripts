tell application "System Events"
    tell process "NotificationCenter"
        set numwins to (count windows)
        repeat with i from numwins to 1 by -1
            click button "Close" of window i
        end repeat
    end tell
end tell
