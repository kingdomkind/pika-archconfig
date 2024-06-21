Packages = {
    Official = {
	--> Required applications
        "base",
        "base-devel",
        "git",
        "grub",
	"linux-zen", "linux-zen-headers",
	"linux", -- "linux-headers", --> Fallback, has no ACS patch, use zen mainly
	"linux-firmware",
	"zsh", -- The shell is ZSH for root
	"zsh-syntax-highlighting",
	"zsh-autosuggestions",
	"zsh-history-substring-search",
        "networkmanager",
        "openssh",
        "amd-ucode",
        "gst-plugin-pipewire",
        "efibootmgr",
        "libpulse",
        "pipewire",
        "pipewire-alsa",
        "pipewire-jack",
        "pipewire-pulse",
        "wireplumber",
        "linux-headers",
	"dkms",
        "dnsmasq",
        "wl-clipboard",
        "libvirt",
        "qemu-full",
	"ntfs-3g",
	"noto-fonts",
	"ttf-font-awesome",
	"ttf-jetbrains-mono-nerd",
	
        --> Apps
        "rustup",
        "flatpak",
        "fastfetch",
        "hyprland",
        "kitty",
        "hyprpaper",
        "python-pywal",
        "dunst",
        "waybar",
        "signal-desktop",
        "rofi-wayland",
        "grim",
        "slurp",
        "btop",
        "virt-manager",
	"element-desktop",
	"steam",
	"vlc",
	"qbittorrent",
	"neovim",
	"nvtop",
	"xdg-desktop-portal-hyprland",
	"nautilus",
	"mangohud",
	"clang",
    },

    Aur = {
	--> Simple AUR
	"armcord-bin",
        "nvm", "vscodium",
        "librewolf-bin",
        "rofi-power-menu",
        "zapzap",
	"satty-bin",
        "freetube-bin",
	"betterbird-bin",
	"zsh-theme-powerlevel10k-git",
	"jellyfin-media-player",
	"mirage",

	--> Advanced AUR
	{["base"] = "nvidia-utils-beta", ["sub"] = {"nvidia-utils-beta", "opencl-nvidia-beta", "nvidia-settings-beta"}},
	{["base"] = "nvidia-open-beta", ["sub"] = {"nvidia-open-beta-dkms"}},
	{["base"] = "Rust-VPN-Handler", ["sub"] = {"vpn_handler"}, ["url"] = "https://github.com/kingdomkind/Rust-VPN-Handler.git"},
    },


    Flatpak = {
        "com.github.IsmaelMartinez.teams_for_linux",
	"org.jellyfin.JellyfinServer",
    },
}

Symlinks = {
    ["/home/pika/.config/hypr/hyprland.conf"] = "/home/pika/Config/hyprland.conf",
    ["/etc/default/grub"] = "/home/pika/Config/boot/grub",
    ["/home/pika/.config/wal/templates/colors-hyprland.conf"] = "/home/pika/Config/scripts/wallpaper/colors-hyprland.conf",
    ["/home/pika/.config/kitty/kitty.conf"] = "/home/pika/Config/scripts/kitty/kitty.conf",
    ["/home/pika/.config/rofi/config.rasi"] = "/home/pika/Config/scripts/rofi/config.rasi",
    ["/home/pika/.config/wal/templates/dunstrc"] = "/home/pika/Config/scripts/dunst/dunstrc",
    ["/home/pika/.config/waybar/config"] = "/home/pika/Config/scripts/waybar/config",
    ["/home/pika/.config/waybar/style.css"] = "/home/pika/Config/scripts/waybar/style.css",
    ["/home/pika/.config/nvim"] = "/home/pika/Config/neovim",
    ["/root/.config/nvim"] = "/home/pika/Config/neovim",
    ["/etc/mkinitcpio.conf"] = "/home/pika/Config/boot/mkinitcpio.conf",
    ["/etc/fstab"] = "/home/pika/Config/boot/fstab",
    ["/home/pika/.zshrc"] = "/home/pika/Config/zshrc",
    ["/root/.zshrc"] = "/home/pika/Config/zshrc",
    ["/usr/share/grub/themes/sleek"] = "/home/pika/Config/boot/sleek",
}

InstallLocations = {
    ["Base"] = "/home/pika/.config-king/",
    ["Aur"] = "/home/pika/.config-king/aur/"
}

function HookPost()

	--> Ensure that the default network is running & auto-started
	local Handle = io.popen("sudo virsh net-list --all | grep default | awk '{gsub(/ +/, \",\"); print}' | sed 's/^,//'")
	local Result = Handle:read("*a")
	Handle:close()

	local Status = {}

	for Value in Result:gmatch("[^,]+") do
		table.insert(Status, Value)
	end

	if Status[1] ~= nil then
		if Status[2] ~= "active" then
			os.execute("sudo virsh net-start default")
		end

		if Status[3] ~= "yes" then
			os.execute("sudo virsh net-autostart default")
		end
	else
		print("Failed to grep any results for default! (virsh network)")
	end
end
