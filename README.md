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
| `.local/bin/` | `app-manager` (pacman/AUR/web-app TUI) and `launch-webapp` |
| `.bashrc`, `.zshrc`, `.profile`, … | shell startup files |
| `.gitconfig` | git identity |

## Install

Back up the existing files first, then copy or symlink them into `$HOME`:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
cp -a dotfiles/.config dotfiles/.local ~/
cp -a dotfiles/.bashrc dotfiles/.bash_profile dotfiles/.profile \
      dotfiles/.zshrc dotfiles/.zshenv dotfiles/.gitconfig ~/
```

Install the script dependencies:

```sh
sudo pacman -S --needed gum fzf desktop-file-utils
```

Then make the scripts executable if your copy did not preserve the mode:

```sh
chmod +x ~/.local/bin/app-manager ~/.local/bin/launch-webapp
```

`app-manager` also needs a Chromium/Firefox browser for the web-app feature.

### app-manager only

To use the package manager on another Arch/CachyOS machine without the rest of the rice:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
sudo pacman -S --needed gum fzf
install -Dm755 dotfiles/.local/bin/{app-manager,launch-webapp} ~/.local/bin/
```

AUR install/remove options additionally need `paru` or `yay`.

Log out and back in (or restart niri) to apply.

## Not included

- `~/.config/fish/fish_variables` — machine state and API keys.
- Wallpapers (`~/Bilder/Wallpaper`, ~123 MB).
- Browser, Bitwarden, VPN, mail, Discord and other app data.
