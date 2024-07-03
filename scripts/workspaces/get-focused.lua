local handle = io.popen("hyprctl monitors | grep -E \"Monitor|focused\"")
local configuration = handle:read("*a")
handle:close()

local configuration_table = {}
for line in configuration:gmatch("[^\r\n]+") do
	table.insert(configuration_table, line)
end

local target_monitor = nil
for index, line in ipairs(configuration_table) do
	if string.find(line, "Monitor") then
		local monitor_focus = configuration_table[index + 1]
		if string.find(monitor_focus, "yes") then
			--> Found target monitor
			local words = {}
			for word in line:gmatch("%S+") do
				table.insert(words, word)
			end
				target_monitor = words[2]
		end
	end
end

print(target_monitor)
