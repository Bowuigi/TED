--declare variables
option= arg[1]
file= arg[2]
if file then
	buffer=io.open(file)
elseif option~="-h" then
	io.stderr:write("Please input a file for operation\n")
end
--process
if option=="-r" then
	
	if file then
		print(buffer:read("*a"))
	end

elseif option=="-w" then
	if file then
	buffer=io.open(file,"a")
		if arg[3] then
			for args=0,#arg,1 do
				if args>=3 and arg[args]=="//n" then
					buffer:write(string.char(10)..string.char(13))
				elseif args>=3 then
			 		buffer:write(arg[args])
				end
			end
		else
			io.stderr:write("Invalid or null string\n")
		end
	end
	
elseif option=="-h" then
	print("TED: cli Text EDitor")
	print("Usage: ted (-r/-w/-h) [filename] [string to add if -w]")
	print("-w writes to file")
	print("-r read content of a file and print it to stdout (to the cli)")
	print("-h open this message")
	print("Remember to use //n as a separate argument to add newlines")
else

	io.stderr:write("Option not found, try using -h instead\n")

end

if file then
buffer:close()
end

print("TED: finished")