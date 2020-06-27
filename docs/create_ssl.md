# [←](https://github.com/truewebartisans/useful-playbooks) `create_ssl` playbook

Creates a new website folder (called as domain name) and SSL certificate (_thanks to [Let's Encrypt](https://letsencrypt.org/)_) for it. Included the best practice for `Nginx` config and task for CRON to renew.

## Usage

```bash
ansible-playbook \
                  create_ssl-playbook.yml \
                  --user <USER> \
                  --extra-vars "host=<HOST> domain=<DOMAIN>"
```

### Extra vars

- `<USER>` (**required**/_optional_) remote user's username (for example, `root`)
- `<HOST>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)
- `<DOMAIN>` (**required**) domain name without `www` part (for example, `website.com`)

> 👌 Yes, actually you can specify the `<USER>` argument in your `/etc/ansible/hosts` file and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.
>
> ☝️ Please note: Certbot can create the SSL certificates for both `website.com` and `www.website.com`.

## Features

- Added repository:
  - `ppa:certbot/certbot`
    - Skipped for Ubuntu `20.04 LTS`
- Installed latest versions:
  - [`Certbot`](https://certbot.eff.org/) for Nginx
- Configured by the best practice:
  - Nginx config for your domain
  - SSL certificate for domain
  - CRON task for automatically renew SSL
  - HTTP/2 (443 port)
  - Redirect from `www` to `non-www` domain
  - Redirect from `http` to `https`
  - Folder for website files (`/var/www/<domain>/html`)

## Tested to work

- Ubuntu `20.04+ LTS`, `18.04+ LTS`, `16.04+ LTS`
- Debian `10 (Buster)`, `9 (Stretch)`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [pull request](https://github.com/truewebartisans/useful-playbooks/pulls).

## 📺 Media

A list of articles and video lessons, where `new_server` playbook is used:

- It's empty for now... 😐

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
