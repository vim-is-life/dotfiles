# Convert HH:MM times in whenfree output to 12-hour AM/PM notation.
# AWK executes this block once per input line; $0 contains the current line.
{
	# match() sets RSTART and RLENGTH (1-based match position and length).
	while (match($0, /[0-2]?[0-9]:[0-5][0-9]/)) {
		# Extract the time and split it into an AWK array (1-indexed).
		time = substr($0, RSTART, RLENGTH)
		split(time, parts, ":")
		# Convert the individual components to 12-hour notation.
		hour = parts[1] + 0
		minute = parts[2]
		am_or_pm = hour < 12 ? "am" : "pm"
		hour = hour % 12 ? hour % 12 : 12
		# sprintf() constructs a string without printing it.
		converted_time = sprintf("%d:%s%s", hour, minute, am_or_pm)
		printf "%s%s", substr($0, 1, RSTART - 1), converted_time
		# Consume processed text so match() finds the next time.
		$0 = substr($0, RSTART + RLENGTH)
	}
	# Print remaining text and terminate the line.
	print $0
}

