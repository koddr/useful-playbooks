<img align="right" width="150px" src="logo.svg" alt="logo"/>

# 🚚 Useful snippets for easily deploy

Useful _hand-crafted_ snippets for **easily** deploy your static website or webapp to **absolutely** fresh virtual server (VDS/VPS) launched on GNU/Linux. Only **5 minutes** from the first login to complete server setup and start! **It just works, thanks to [`bash`](https://www.gnu.org/software/bash/)**.

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

Open SSH config:

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
2. Set establish execution rights to `script_name` (_if needs_):

```console
sudo chmod +x ./script_name.sh
```

3. Run `script_name` with (_or without_) params and options:

```console
sudo ./script_name.sh params --options
```

## 🎯 Available scripts

### `./new_vds.sh <domain> [options]`

Auto configure a fresh virtual server for a **static website** or **SPA** (single-page application, based on frontend framework, like [`Preact`](https://preactjs.com/), [`React`](https://reactjs.org/), [`Vue.js`](https://vuejs.org/), [`Svelte`](https://svelte.dev/) or [`Angular`](https://angular.io/)), launched on `Ubuntu 18.04+`.

#### Download

```console
wget -O new_vds.sh https://raw.githubusercontent.com/truewebartisans/snippets-deploy/master/new_vds.sh
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

> ☝️ Please note: Certbot will get the SSL certificates for both `website.com` and `www.website.com`. _If you only need to obtain a certificate for the one domain without `www`, unfortunately, this is not supported at this time._

#### Options

- `--skip-update` (_optional_) skip `Update & Upgrade` initial part

## ⚠️ License

MIT
