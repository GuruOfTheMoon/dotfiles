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
| `.bashrc`, `.zshrc`, `.profile`, … | shell startup files |

## Install

Back up the existing files first, then copy or symlink them into `$HOME`:

```sh
git clone https://github.com/GuruOfTheMoon/dotfiles.git
cp -a dotfiles/.config ~/
cp -a dotfiles/.bashrc dotfiles/.bash_profile dotfiles/.profile \
      dotfiles/.zshrc dotfiles/.zshenv ~/
```

Set your own git identity (the repo intentionally ships no `.gitconfig`):

```sh
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Log out and back in (or restart niri) to apply.

## Other tools I use for my desktop experience:

- [arch-app-manager](https://github.com/GuruOfTheMoon/arch-app-manager) — pacman/AUR package manager and web-app creator TUI.
- [niri-display-manager](https://github.com/GuruOfTheMoon/niri-display-manager) — Win+P-style display menu (mirror, extend, resolution, rotation, scale, VRR) for niri.

## Not included

- `~/.config/fish/fish_variables` — machine state and API keys.
- Wallpapers (`~/Bilder/Wallpaper`, ~123 MB).
- Browser, Bitwarden, VPN, mail, Discord and other app data.
