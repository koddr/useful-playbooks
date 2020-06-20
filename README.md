# 🚚 Useful snippets for easily deploy

<img align="right" width="132px" src=".github/logo.svg" alt="logo"/>

Useful _hand-crafted_ snippets for **easily** deploy your static website or webapp to **absolutely** fresh virtual server (VDS/VPS or Droplet) launched on GNU/Linux. Only **5 minutes** from the first login to complete server setup and start. **There you go! It just works**.

🔔 Snippets short list:

- [`./new_vds.sh`](https://github.com/truewebartisans/snippets-deploy#new_vdssh-domain-options) for auto configure a fresh virtual server
- [`./create_ssl.sh`](https://github.com/truewebartisans/snippets-deploy#create_sslsh-domain-options) for create a new SSL certificate

## 💡 Before we begin

<details>
<summary>Please make sure, that you do all console commands as sudo group user, but not root</summary><br/>

Create a new user (where `USER` is username you want to add):

```console
adduser USER
```

Enter password (twice) and leave blank to other personal information.

Now, let's add `USER` to `sudo` group:

```console
adduser USER sudo
```

</details>

<details>
<summary>For security reasons, we recommend to disable possible to login as root user to your server</summary><br/>
  
Only **after** you have created a new user in `sudo` group, open SSH config:

```console
nano /etc/ssh/sshd_config
```

Find `PermitRootLogin` and set it to `no`, save (`ctrl + o`) and close `nano` editor (`ctrl + x`).

Restart SSH service and logout:

```console
systemctl restart sshd
exit
```

Re-login to your virtual server as `USER` (where `IP` is your server IP):

```console
ssh USER@IP
```

</details>

## 📚 Usage

1. Download script on your server by link at `Available scripts` section.

> ☝️ **By the way:** we're using [`shrts.website`](https://github.com/truewebartisans/shrts.website) to shorting links for make it easier to copy `wget` command.

2. Set establish execution rights to `script_name` (_if needs_):

```console
sudo chmod +x ./script_name.sh
```

3. Run `script_name` with (_or without_) params and options:

```console
sudo ./script_name.sh params --options
```

## 🎯 Available scripts

<br/>

### `./new_vds.sh <domain> [options]`

#### Description

Auto configure a fresh virtual server for a **static website** or **SPA** (single-page application, like `React`, `Vue.js`, `Svelte` or else).

#### Tested to work

- Ubuntu `16.04+ LTS`, `18.04+ LTS`

#### Download

```console
wget -O new_vds.sh https://shrts.website/sd/new-vds
```

#### Features

- Update Ubuntu distributive
- Update & Upgrade, auto remove packages
- Configure [`UFW`](https://help.ubuntu.com/community/UFW) firewall with protection rules
- Install [`Nginx`](https://nginx.org/) with [`Brotli`](https://github.com/google/brotli) module
- Create configs by best practice for [Nginx](https://github.com/truewebartisans/snippets-deploy/blob/master/new_vds.sh#L73-L153), [Brotli](https://github.com/truewebartisans/snippets-deploy/blob/master/new_vds.sh#L161-L171) and [static website](https://github.com/truewebartisans/snippets-deploy/blob/master/new_vds.sh#L209-L250)
- HTTP/2 (443 port) by default
- Get SSL certificates for domain by [`Certbot`](https://certbot.eff.org/) with automatically renew
- Redirect from `www` to `non-www` domain and from `http` to `https`
- A folder for website files is `/var/www/<domain>/html`

#### Params

- `<domain>` (**required**) your domain without `www` part (_for example, `website.com`_)

> ☝️ Please note: Certbot can create the SSL certificates for both `website.com` and `www.website.com`. He will ask about it at the last step.

#### Options

- `--skip-update` (_optional_) skip `Update & Upgrade` initial part
- `--force` (_optional_) force re-create NGINX config for your domain

<br/>

### `./create_ssl.sh <domain> [options]`

#### Description

Create a new SSL certificate (_thanks to [Let's Encrypt](https://letsencrypt.org/)_) for your domain with the best practice `NGINX` config and task for CRON to renew.

#### Tested to work

- Ubuntu `18.04+ LTS`, `16.04+ LTS`
- Debian `10 (Buster)`, `9 (Stretch)`

#### Download

```console
wget -O create_ssl.sh https://shrts.website/sd/create-ssl
```

#### Features

- Install [`Certbot`](https://certbot.eff.org/)
- Create config by best practice for [Nginx](https://github.com/truewebartisans/snippets-deploy/blob/master/create_ssl.sh#L70-L111)
- HTTP/2 (443 port) by default
- Get SSL certificates for domain with automatically renew
- Redirect from `www` to `non-www` domain and from `http` to `https`
- A folder for website files is `/var/www/<domain>/html`

#### Params

- `<domain>` (**required**) your domain without `www` part (_for example, `website.com`_)

> ☝️ Please note: Certbot can create the SSL certificates for both `website.com` and `www.website.com`. He will ask about it at the last step.

#### Options

- `--skip-install` (_optional_) skip `Install Certbot` part
- `--force` (_optional_) force re-create NGINX config for your domain

<br/>

## 📺 Media

A list of articles and video lessons, where `snippets-deploy` is used:

- [✨ A practical guide to GitHub Actions: build & deploy a static 11ty website to remote virtual server after push](https://dev.to/koddr/automate-that-a-practical-guide-to-github-actions-build-deploy-a-static-11ty-website-to-remote-virtual-server-after-push-d19) by [Vic Shóstak](https://github.com/koddr) @ 01 Jun 2020

> Make [pull requests](https://github.com/truewebartisans/snippets-deploy/pulls) with links to your articles and videos! We will post them right here.

## ⚠️ License

MIT &copy; [Vic Shóstak](https://github.com/koddr) & [True web artisans](https://1wa.co/).
