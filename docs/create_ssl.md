# [←](https://github.com/truewebartisans/useful-playbooks) 📖 `create_ssl` playbook

Creates a new website folder and SSL certificate from [`Let's Encrypt`](https://letsencrypt.org/) with auto renew by CRON task.

## Usage

```bash
ansible-playbook \
                  create_ssl-playbook.yml \
                  --user <USER> \
                  --extra-vars "host=<HOST> domain=<DOMAIN> email=<EMAIL>"
```

### Extra vars

- `<USER>` (**required**) remote user's username (for example, `root`)
- `<HOST>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)
- `<DOMAIN>` (**required**) domain name without `www` part (for example, `website.com`)
- `<EMAIL>` (**required**) certificate holder's email address

> 👌 Yes, actually you can specify the `<USER>` argument in your inventory file (`/etc/ansible/hosts`) and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.
>
> ☝️ Please note: Certbot creates the SSL certificates for both `website.com` and `www.website.com`.

## Features

- Added repository:
  - `ppa:certbot/certbot`
    - Skipped for Ubuntu `20.04 LTS`
- Installed latest versions:
  - [`Certbot`](https://certbot.eff.org/)
  - `python3-certbot-nginx`
- Configured by the best practice:
  - Nginx config for your domain
  - SSL certificate for domain
  - CRON task for automatically renew SSL
  - HTTP/2 (443 port) by default
  - Redirect from `www` to `non-www`
  - Redirect from `http` to `https`
  - Folder for the website files (`/var/www/<DOMAIN>/html`)

> 👍 If you need to change Nginx config for your website, feel free to edit a `/etc/nginx/sites-available/<DOMAIN>.conf` file.

## Tested to work

- Ubuntu `20.04+ LTS`, `18.04+ LTS`, `16.04+ LTS`
- Debian `10 (Buster)`, `9 (Stretch)`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [pull request](https://github.com/truewebartisans/useful-playbooks/pulls).

### Troubleshooting

- If you will be get an error `Permission Denied` in Nginx logs (right here `/var/log/nginx/error.log`), when visit your website:
  - Check `chmod` (might be `0700`) and `chown` (might be `<USER>:<USER>`) of the website and `/var/www` folders.
  - Add parameter `user <USER>;` to the configuration file (`/etc/nginx/nginx.conf`) above `http {...}` and reload web server.

## 📺 Media

A list of articles and video lessons, where `create_ssl` playbook is used:

- It's empty for now... 😐

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
