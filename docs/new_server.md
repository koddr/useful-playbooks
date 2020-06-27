# [←](https://github.com/truewebartisans/useful-playbooks) `new_server` playbook

Configures a fresh remote virtual server with the best practice for `Nginx` config and `UFW` firewall rules.

## Usage

```bash
ansible-playbook \
                  new_server-playbook.yml \
                  --user <user> \
                  --extra-vars "host=<host>"
```

### Extra vars

- `<user>` (**required**/_optional_) remote user's username (for example, `root`)
- `<host>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)

> 👌 Yes, actually you can specify the `<user>` argument in your `/etc/ansible/hosts` file and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

## Features

- Update & Upgrade distributive
- Added repository:
  - `ppa:hda-me/nginx-stable`
    - Skipped for Ubuntu `20.04 LTS`
- Installed latest versions:
  - [`Nginx`](https://nginx.org/)
  - [`UFW`](https://help.ubuntu.com/community/UFW) firewall
- Configured by the best practice:
  - Nginx
  - UFW rules

## Tested to work

- Ubuntu `20.04+ LTS`, `18.04+ LTS`, `16.04+ LTS`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [PR](https://github.com/truewebartisans/useful-playbooks/pulls).

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
