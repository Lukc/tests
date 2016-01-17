separator = " "

lines = [ [match for match in line\gmatch "[^" .. separator .. "]+"] for line in io.lines!]

sizes = {}
sizes = [math.max (sizes[i] or 0), (if line[i] then #line[i] else 0) for i = 1, #line] for line in *lines

lines = [ [string.format "%-" .. (sizes[i] or 0) .. "s", line[i] for i = 1, #line] for line in *lines]

io.write line, "\n" for line in *[table.concat line, separator for line in *lines]
