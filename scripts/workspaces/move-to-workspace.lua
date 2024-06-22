local utility = require("utility")
local target_workspace = arg[1]
target_workspace = utility.get_target_workspace(target_workspace)
os.execute("hyprctl dispatch movetoworkspace ".. target_workspace)

