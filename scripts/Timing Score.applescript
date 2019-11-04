tell application "TimingHelper"
set usageData to get time summary between (current date) and (current date)  
set score to productivity score of usageData  
set total to overall total of usageData  
delete usageData -- this is required to avoid accumulating old summaries (and thus leaking memory)    
return ((round (score * 100)) as string) & "% in " & (round (total / 60)) & "m"
end tell
