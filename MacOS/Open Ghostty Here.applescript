tell application "Finder"
	set finderPath to (POSIX path of (target of front window as alias))
end tell

-- Launch Ghostty and cd into that path, then start an interactive shell
do shell script "open -n -a Ghostty --args -e sh -c " & quoted form of ("'cd " & finderPath & " && exec $SHELL -l'")
