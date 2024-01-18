# Ansible role: me

Setups a machine for me. Doesn't install dotfiles.

## Requirements

No hard requirements. But this role was designed to run either on a MacBook or a machine using Arch (btw).

## Role Variables

This role depends on some ansible facts to be present.

- `ansible_user_dir` as default home directory
- `ansible_user_id` as default user name
- `ansible_user_shell` as default user shell
- `ansible_pkg_mgr` to determine the package manager on the dev machine
- `ansible_distribution` and / or `ansible_os_family` to determine any OS specific configuration that needs to be done.

The following variables only exist to make future refactors a littler simpler. They shouldn't be modified without good reason.

- `ssh_src_key` path to the (encrypted) ssh keys
- `ssh_dest_key` path to place the ssh keys in
- `ssh_github_fingerprints` ssh fingerprints that are added to known hosts

The actual config consists of:

- `neovim_dest` location to checkout the neovim repo.
- `neovim_version` branch name to use. Use `HEAD` for the latest, `stable` for the stable release.

## Dependencies

None.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: workstations
  roles:
    - name: lrosenfeldt.me
      vars:
        neovim_version: stable # or HEAD if you want the latest version
        neovim_dest: "{{ ansible_user_dir }}/nvim"
```

## License

MIT
