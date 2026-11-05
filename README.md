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

Make the scripts executable if your copy did not preserve the mode:

```sh
chmod +x ~/.local/bin/app-manager ~/.local/bin/launch-webapp
```

Log out and back in (or restart niri) to apply.

## Not included

- `~/.config/fish/fish_variables` — machine state and API keys.
- Wallpapers (`~/Bilder/Wallpaper`, ~123 MB).
- Browser, Bitwarden, VPN, mail, Discord and other app data.
