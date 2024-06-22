Utility = {}

function Utility.get_target_workspace(target_workspace)
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

	if target_monitor == "HDMI-A-1" then
		target_workspace = target_workspace + 10
	end

	print("Target Monitor: " .. target_monitor)
	print("Target Workspace: " .. target_workspace)
	return target_workspace
end

return Utility
