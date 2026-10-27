# Purpose: Extract a named section from defaults.conf.
# Usage: awk -v section=durations -f parse-defaults.awk defaults.conf

# Skip comments and empty lines.
/^[[:space:]]*#/ || /^[[:space:]]*$/ {
	next
}

# Track whether we're inside the requested section.
/^\[/ {
	active = ($0 == "[" section "]")
	next
}

# Print entries from the selected section.
active {
	print
}

