# snippets-deploy

Useful snippets for deploy.

## ⚠️ Before we start

<details>
<summary>Please make sure, that you do all console commands as sudo group user</summary><br/>

Create a new user (where `USER` is username you want to add):

```console
adduser USER
```

Add `USER` to `sudo` group:

```console
adduser USER sudo
```

</details>

<details>
<summary>For security reasons, we recommend to disable possible to login as root user to your VDS</summary><br/>

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

Re-login to your VDS as `USER` (where `IP` is your server IP):

```console
ssh USER@IP
```

</details>

## Usage

```console
# Clone this repository
git clone https://github.com/truewebartisans/snippets-deploy.git

# Go to directory
cd snippets-deploy

# Set establish execution rights to script (if needs)
sudo chmod +x ./script_name.sh

# Run script with (or without) params/options
sudo ./script_name.sh params --options
```

## Available scripts

### `./new_vds.sh <domain> [options]`

Configured a new VDS, based on Ubuntu.

- Update & Upgrade, `autoremove` packages
- Update Ubuntu distributive
- Nginx with [`Brotli`](https://github.com/google/brotli) module
- Best practice configs for Nginx and static website
- SSL for domain by [Certbot](https://certbot.eff.org/) with automatically renew
- `ufw` firewall with protection rules

#### Params

- `<domain>` (required) your domain without `www` part (for example, `1wa.co`)

> Please note: Certbot will get the SSL certificates for both `1wa.co` and `www.1wa.co`. _If you only need to obtain a certificate for a domain without `www`, unfortunately, this is not supported at this time._ Keep an eye out for updates!

#### Options

- `--skip-update` (optional) skip Update & Upgrade initial part

## License

MIT
