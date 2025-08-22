tell application "Finder"
	set finderPath to (POSIX path of (target of front window as alias))
end tell

tell application "iTerm"
	activate
	
	try
		-- Try to create a new tab in the current window
		tell current window
			set newTab to (create tab with default profile)
			set targetSession to current session of newTab
		end tell
	on error
		-- Fallback: create a new window
		set newWindow to (create window with default profile)
		set targetSession to current session of newWindow
	end try
	
	tell targetSession
		write text "cd \"" & finderPath & "\""
	end tell
end tell
