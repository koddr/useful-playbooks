# [←](https://github.com/truewebartisans/useful-playbooks) 📖 `new_server` playbook

Configures a fresh remote virtual server with the best practice for [`Nginx`](https://nginx.org/en/) config and [`UFW`](https://help.ubuntu.com/community/UFW) firewall rules.

## Usage

```bash
ansible-playbook \
                  new_server-playbook.yml \
                  --user <USER> \
                  --extra-vars "host=<HOST>"
```

### Extra vars

- `<USER>` (**required**) remote user's username (for example, `root`)
- `<HOST>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)

> 👌 Yes, actually you can specify the `<USER>` argument in your inventory file (`/etc/ansible/hosts`) and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

## Features

- Update & Upgrade distributive
- Added repository:
  - `ppa:nginx/stable`
    - Skipped for Ubuntu `20.04 LTS`
- Installed latest versions:
  - [`Nginx`](https://nginx.org/)
  - [`UFW`](https://help.ubuntu.com/community/UFW) firewall
- Configured by the best practice:
  - Nginx
  - UFW rules

## Tested to work

- Ubuntu `20.04+ LTS`, `18.04+ LTS`, `16.04+ LTS`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [pull request](https://github.com/truewebartisans/useful-playbooks/pulls).

## 📺 Media

A list of articles and video lessons, where `new_server` playbook is used:

- [✨ A practical guide to GitHub Actions: build & deploy a static 11ty website to remote virtual server after push](https://dev.to/koddr/automate-that-a-practical-guide-to-github-actions-build-deploy-a-static-11ty-website-to-remote-virtual-server-after-push-d19) @ 01 Jun 2020

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
