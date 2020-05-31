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

# Set establish execution rights (if needs)
sudo chmod +x ./new_vds.sh

# Run script
sudo ./new_vds.sh example.com
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

-  `<domain>` your domain without `www` part (Certbot will generate SSL certs for `example.com` and `www.example.com`)

#### Options

- `--skip-update` use this second params (after domain name) to skip update & upgrade part
