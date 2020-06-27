# [←](https://github.com/truewebartisans/useful-playbooks) `install_brotli` playbook

Installs `Brotli` module for your current `Nginx` version.

> ☝️ Please note, that playbook uses the current version of Nginx installed on your remote server. Check, if it's installed before running!

## Usage

```bash
ansible-playbook \
                  install_brotli-playbook.yml \
                  --user <USER> \
                  --extra-vars "host=<HOST>"
```

### Extra vars

- `<USER>` (**required**/_optional_) remote user's username (for example, `root`)
- `<HOST>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)

> 👌 Yes, actually you can specify the `<USER>` argument in your `/etc/ansible/hosts` file and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

## Features

- Added lines to files:
  - `load_module` lines with Brotli module to the start of Nginx config (`/etc/nginx/nginx.conf`)
- Installed latest versions:
  - [`Brotli module`](https://github.com/google/ngx_brotli) for Nginx
  - Packages to `./configure` and run `make` for Brotli module (`git`, `gcc`, `cmake`, `libpcre3`, `libpcre3-dev`, `zlib1g`, `zlib1g-dev`, `openssl`, `libssl-dev`)
- Configured by the best practice:
  - Brotli config

## Tested to work

- Ubuntu `20.04+ LTS`, `18.04+ LTS`, `16.04+ LTS`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [pull request](https://github.com/truewebartisans/useful-playbooks/pulls).

## 📺 Media

A list of articles and video lessons, where `install_brotli` playbook is used:

- [⚙️ How to install Brotli module for Nginx on Ubuntu 20.04+](https://dev.to/koddr/how-to-install-brotli-module-for-nginx-on-ubuntu-20-04-2ocp) @ 27 Jun 2020

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
