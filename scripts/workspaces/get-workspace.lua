local target_monitor = arg[1]

local handle = io.popen("hyprctl monitors | grep -E \"Monitor|active workspace\"")
local configuration = handle:read("*a")
handle:close()

local configuration_table = {}
for line in configuration:gmatch("[^\r\n]+") do
	table.insert(configuration_table, line)
end

local target_workspace = nil
for index, line in ipairs(configuration_table) do
	if string.find(line, target_monitor, 1, true) then -- Do not search for pattersn
		--> Found target monitor
		local words = {}
		for word in configuration_table[index+1]:gmatch("%S+") do
			table.insert(words, word)
		end
		target_workspace = words[3]
		break
	end
end

if target_workspace == nil then
	target_workspace = "nil"
end

print(target_monitor.. ": " .. target_workspace)
