--declare variables
Option= arg[1]
File= arg[2]
if File then
	Buffer=io.open(File)
elseif Option~="-h" then
	io.stderr:write("TED:Please input a File for operation\n")
end
--process
if (Option=="-r" or Option=="--read") then
	
	if File then
		print(Buffer:read("*a"))
	end

elseif (Option=="-a" or Option=="--append") then
	if File then
		Buffer=io.open(File,"a+")
		if #arg>=3 then
			for args=0,#arg,1 do
				if args>=3 and arg[args]=="//n" then
					Buffer:write(string.char(10)..string.char(13))
				elseif args>=3 then
			 		Buffer:write(arg[args])
				end
			end
			Buffer:flush()
		else
			io.stderr:write("Invalid or null string\n")
		end
	end
	
elseif (Option=="-R" or Option=="--replace") then
	if File then
		Content=Buffer:read("*a")
		Replace=arg[3]
		Finalstr=""
		if #arg>=4 then
			for args=0,#arg,1 do
				if args>=4 and arg[args]=="//n" then
					Finalstr=Finalstr..(string.char(10)..string.char(13))
				elseif args>=4 then
					Finalstr=Finalstr..(arg[args])
				end
			end
			Content=Content:gsub(Replace,Finalstr)
			Buffer=io.open(File,"w+")
			Buffer:write(Content)
			Buffer:flush()
		else
			io.stderr:write("Invalid or null string\n")
			io.stderr:write("Invalid or null pattern\n")
		end
	end
elseif (Option=="-h" or Option=="--help" or Option=="-?") then
	print("TED: cli Text EDitor")
	print("Usage: ted (-r/-w/-h) [filename] [string to add if on append mode/pattern to replace] [string to be replaced to if pattern is found]")
	print("-a/--append appends to File")
	print("-r/--read read content of a File and print it to stdout (to the cli)")
	print("-R/--replace Replace content if pattern is found (patterns must be lua's gsub compatible)")
	print("-h/--help/-? open this message")
	print("Remember to use //n as a separate argument to add newlines")
else

	io.stderr:write("TED:Option not found, try using -h instead\n")

end

if File then
Buffer:close()
end

io.write("TED: finished\n")