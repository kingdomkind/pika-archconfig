Packages = {
    Official = {
	--> Required applications
        "base",
        "base-devel",
        "git",
        "grub",
	"linux-zen", "linux-zen-headers",
	"linux-firmware",
	"flatpak", -- Required for script
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
        "libvirt",
        "qemu-full",
	"ntfs-3g",
	"noto-fonts", "noto-fonts-emoji",
	"ttf-jetbrains-mono-nerd",
	"nvidia-open-dkms", "nvidia-settings",
	"cuda",
	"libnotify",

        --> Apps
        "rustup",
        "fastfetch",
        "dunst",
        "signal-desktop",
        "rofi-wayland",
        "btop",
        "virt-manager",
	"qbittorrent",
	"neovim",
	"nvtop",
	"clang",
	"macchanger",
	"docker", "docker-compose", "nvidia-container-toolkit",
	"ranger",
	"jdk21-openjdk",
	"xorg-server",
	"xorg-xinit",
	"obs-studio",
	"flameshot",
	"meson",
	"xorg-xrandr",
	"alacritty",
	"feh",
	"python-pywal",
	"xclip",
	"bitwarden",
	"npm",
	"telegram-desktop",
	"audacity",
	"movit",
	"kdenlive",
    },

    Aur = {
	--> Simple AUR
        "nvm", "vscodium",
        "zapzap",
	"jellyfin-media-player",
	"nvim-lazy",
	"prismlauncher",
	"picom-pijulius-git",
	"brave-bin",
	"davinci-resolve",

	--> Advanced AUR
	{["base"] = "Rust-VPN-Handler", ["sub"] = {"vpn_handler"}, ["url"] = "https://github.com/kingdomkind/Rust-VPN-Handler.git"},
    },


    Flatpak = {
        "com.github.IsmaelMartinez.teams_for_linux",
	"com.valvesoftware.Steam",
    },
}

Symlinks = {
    ["/etc/default/grub"] = "/home/pika/Config/boot/grub",
    ["/home/pika/.config/picom/picom.conf"] = "/home/pika/Config/picom.conf",
    ["/home/pika/.config/alacritty/alacritty.toml"] = "/home/pika/Config/scripts/alacritty/alacritty.toml",
    ["/home/pika/.config/rofi/config.rasi"] = "/home/pika/Config/scripts/rofi/config.rasi",
    ["/home/pika/.config/wal/templates/dunstrc"] = "/home/pika/Config/scripts/dunst/dunstrc",
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
