# dotfiles

My Wayland rice on CachyOS: **niri** (scrollable tiling) + **Noctalia** shell.

## Included

| Path | What |
| --- | --- |
| `.config/niri/` | niri compositor config, split into `cfg/*.kdl` |
| `.config/noctalia/` | Noctalia shell config |
| `.config/alacritty/` | Alacritty terminal + Noctalia color theme |
| `.config/fish/` | fish shell config and functions |
| `.config/micro/` | micro editor settings |
| `.config/mimeapps.list` | default applications |
| `.local/bin/` | `app-manager` (pacman/AUR/web-app TUI), `display-manager` (Win+P-style display TUI) and `launch-webapp` |
| `.bashrc`, `.zshrc`, `.profile`, … | shell startup files |

## Install

Back up the existing files first, then copy or symlink them into `$HOME`:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
cp -a dotfiles/.config dotfiles/.local ~/
cp -a dotfiles/.bashrc dotfiles/.bash_profile dotfiles/.profile \
      dotfiles/.zshrc dotfiles/.zshenv ~/
```

Set your own git identity (the repo intentionally ships no `.gitconfig`):

```sh
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Install the script dependencies:

```sh
sudo pacman -S --needed gum fzf jq curl file desktop-file-utils
```

Then make the scripts executable if your copy did not preserve the mode:

```sh
chmod +x ~/.local/bin/app-manager ~/.local/bin/display-manager ~/.local/bin/launch-webapp
```

`app-manager` also needs a Chromium/Firefox browser for the web-app feature.

### app-manager only

To use the package and web-app manager on another Arch/CachyOS machine without the rest of the rice:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
sudo pacman -S --needed gum fzf curl file desktop-file-utils
install -Dm755 dotfiles/.local/bin/{app-manager,launch-webapp} ~/.local/bin/
```

AUR install/remove options additionally need `paru` or `yay`, and the web-app feature needs a Chromium/Firefox browser.

Optional niri integration:

```kdl
Mod+Alt+Space {
    spawn "alacritty" "--class" "app-manager" "-e" "sh" "-c" "$HOME/.local/bin/app-manager";
}

window-rule {
    match app-id="app-manager"
    open-floating true
    default-column-width { proportion 0.60; }
    default-window-height { proportion 0.70; }
}
```

The standalone version of this tool lives at [GuruOfTheMoon/arch-app-manager](https://github.com/GuruOfTheMoon/arch-app-manager).

### display-manager only

To use the Win+P-style display menu on another niri machine without the rest of the rice:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
sudo pacman -S --needed gum fzf jq
install -Dm755 dotfiles/.local/bin/display-manager ~/.local/bin/
```

Add the `Mod+P` keybind and the floating-window rule to your niri config:

```kdl
Mod+P hotkey-overlay-title="Open Display Menu: Mirror / Extend" {
    spawn "alacritty" "--class" "display-manager" "-e" "sh" "-c" "$HOME/.local/bin/display-manager";
}

window-rule {
    match app-id="display-manager"
    open-floating true
    default-column-width { fixed 820; }
    default-window-height { fixed 640; }
}
```

Reload niri with `niri msg action load-config-file`. Mirroring additionally needs `wl-mirror` (`sudo pacman -S --needed wl-mirror`); the script offers to install it on first use.

The standalone version of this tool lives at [GuruOfTheMoon/niri-display-manager](https://github.com/GuruOfTheMoon/niri-display-manager).

Log out and back in (or restart niri) to apply.

## Display menu (`Super+P`)

`display-manager` opens a Windows `Win+P`-style TUI. Pick a display connected via
HDMI or DisplayPort, then:

- extend it left/right/above/below another monitor
- mirror another display onto it with `wl-mirror` (offered for installation on first use)
- use only that display, or turn it off
- change resolution/refresh rate, rotation, scale and VRR

The menu is available on `Super+P`; `Super+Shift+P` still turns the monitors off.

## Not included

- `~/.config/fish/fish_variables` — machine state and API keys.
- Wallpapers (`~/Bilder/Wallpaper`, ~123 MB).
- Browser, Bitwarden, VPN, mail, Discord and other app data.
