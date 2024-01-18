# configs

My collected configuration automated with ansible. Because debugging yaml is fun!

## Guides

To setup a machine first run:
```bash
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/lrosenfeldt/ansible/main/scripts/init)"
```

### Scripts

- `./scripts/ci` - runs yamllint, ansible-lint and molecule
- `./scripts/init` - setups a machine to use ansible on itself, actions depend of actual os and platform
- `./scripts/import_ssh` - get current ssh keys from the machine and stored them encrypted in the vault

## For MacOS

- Install iterm2, Docker Desktop.
- Run the playbook.
- Configure Mission Control & Dock.

## Archlinux

TODO

## Ideas

- The current setup is quite convoluted. While I learned a lot about ansible and the testing is nice,
it doesn't seem like the right tool. Especially testing is a hassle. Maybe I can write a simple tool
for myself in go?

- I should investigate why neovim compilation is freezing inside the container (molecule and manual). Maybe it's just the emulation on my mac causing trouble when runnning the compiler- I should investigate why neovim is building inside molecule. Maybe it's just the emulation on my mac causing trouble when runnning the compiler?

- Add a dummy ssh key for the molecule run.

- Add a homebrew container to test mac os stuff.
