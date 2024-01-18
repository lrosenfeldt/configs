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
