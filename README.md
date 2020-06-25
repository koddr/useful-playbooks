# 🚚 Useful playbooks for easily deploy

<img align="right" width="132px" src=".github/logo.svg" alt="logo"/>

Useful [Ansible](https://github.com/ansible/ansible) playbooks for **easily** deploy your website or webapp to **absolutely** fresh virtual server (VDS/VPS or Droplet) launched on GNU/Linux. Only **3 minutes** from the playbook run to complete setup server and start it. **There you go! It just works**.

🔔 Playbooks short list:

- [`new_vds`](https://github.com/truewebartisans/useful-playbooks#new_vds) for auto configure a fresh virtual server
- [`create_ssl`](https://github.com/truewebartisans/useful-playbooks#create_ssl) for create a new website with SSL certificate

## 💡 Before we begin

<details>
<summary>What is Ansible?</summary><br/>

Follow [Wikipedia](<https://en.wikipedia.org/wiki/Ansible_(software)>) page:

<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" width="128px" align="right" alt="ansible logo" />

_Ansible is an open-source software provisioning, configuration management, and application-deployment tool enabling infrastructure as code. It runs on many Unix-like systems, and can configure both Unix-like systems as well as Microsoft Windows. It includes its own declarative language to describe system configuration._

_Ansible was written by Michael DeHaan and acquired by Red Hat in 2015. Ansible is agentless, temporarily connecting remotely via SSH or Windows Remote Management (allowing remote PowerShell execution) to do its tasks._

</details>

<details>
<summary>Why it's so good to use for me?</summary><br/>

Ansible is a radically simple IT automation system. It handles configuration management, application deployment, cloud provisioning, ad-hoc task execution, network automation, and multi-node orchestration. Ansible makes complex changes like zero-downtime rolling updates with load balancers easy.

- Have a dead simple setup process and a minimal learning curve.
- Manage machines very quickly and in parallel.
- Avoid custom-agents and additional open ports, be agentless by leveraging the existing SSH daemon.
- Describe infrastructure in a language that is both machine and human friendly.
- Focus on security and easy auditability/review/rewriting of content.
- Manage new remote machines instantly, without bootstrapping any software.
- Allow module development in any dynamic language, not just Python.
- Be usable as non-root.
- Be the easiest IT automation system to use, ever.

:octocat: GitHub: https://github.com/ansible/ansible

</details>

<details>
<summary>How to work with Ansible and playbooks?</summary><br/>

1. Be sure, that [Python](https://www.python.org/) (version `3.5` or later) is installed.
2. Install Ansible for your OS by [this](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible) instructions.
3. Setting up inventory by [this](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html) guide.

</details>

<details>
<summary>Helpful tools and plugins for working with Ansible</summary><br/>

**VS Code addons:**

- [vscode-ansible](https://marketplace.visualstudio.com/items?itemName=vscoss.vscode-ansible) for code completion, syntax highlighting and linting of Ansible playbooks files
- [vscode-nginx](https://marketplace.visualstudio.com/items?itemName=shanoor.vscode-nginx) for syntax highlighting of Nginx configs

**VS Code config hints:**

For better readability, please add two association to your `.vscode/settings.json`: for Ansible playbooks and `jinja2` templates.

```jsonc
{
  // ...
  "files.associations": {
    "*-domain.j*2": "NGINX",     // for all jinja2 files ended with `domain` word
    "*-playbook.y*ml": "ansible" // for YAML files ended with `playbook` word
  }
  // ...
}
```

</details>

## 📚 Usage

1. Download [ZIP archive](https://github.com/truewebartisans/useful-playbooks/archive/master.zip) or `git clone` this repository
2. Go to the downloaded/clonned folder
3. Select playbook (see [`Available playbooks`](https://github.com/truewebartisans/useful-playbooks#-available-playbooks) section)
4. Run `<playbook_name>` with (_or without_) arguments and extra vars:

```console
ansible-playbook <playbook_name>-playbook.yml [args] [extra vars...]
```

## 🎯 Available playbooks

<br/>

### `new_vds`

Configures a fresh virtual server with the best practice for `Nginx` config, `Brotli` module and `UFW` firewall rules.

**Usage:**

```console
ansible-playbook new_vds-playbook.yml -u <user> --extra-vars "host=<host>"
```

**Extra vars:**

- `<user>` (**required**/_optional_) username of remote user (for example, `root`)

> 👌 Yes, actually you can specify the `<user>` argument in your `/etc/ansible/hosts` file and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

- `<host>` (**required**) name of host you need from `/etc/ansible/hosts` file

**Features:**

- Update & Upgrade distributive
- Added repository:
  - `ppa:hda-me/nginx-stable`
- Installed latest versions: 
  - [`Nginx`](https://nginx.org/)
  - [`Brotli`](https://github.com/google/brotli)
  - Brotli module for Nginx
  - [`UFW`](https://help.ubuntu.com/community/UFW) firewall
- Configured by the best practice: 
  - Nginx
  - Brotli
  - UFW rules

**Tested to work:**

- Ubuntu `18.04+ LTS`, `16.04+ LTS`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [PR](https://github.com/truewebartisans/useful-playbooks/pulls).

<br/>

### `create_ssl`

Creates a new website folder (called as domain name) and SSL certificate (_thanks to [Let's Encrypt](https://letsencrypt.org/)_) for it. Included the best practice for `Nginx` config and task for CRON to renew.

**Usage:**

```console
ansible-playbook create_ssl-playbook.yml -u <user> --extra-vars "host=<host> domain=<domain>"
```

**Extra vars:**

- `<user>` (**required**/_optional_) username of remote user (for example, `root`)

> 👌 Yes, actually you can specify the `<user>` argument in your `/etc/ansible/hosts` file and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

- `<host>` (**required**) name of host you need from `/etc/ansible/hosts` file
- `<domain>` (**required**) your domain without `www` part (_for example, `website.com`_)

> ☝️ Please note: Certbot can create the SSL certificates for both `website.com` and `www.website.com`.

**Features:**

- Added repository:
  - `ppa:certbot/certbot`
- Installed latest versions: 
  - [`Certbot`](https://certbot.eff.org/) for Nginx
- Configured by the best practice: 
  - Nginx config for your domain
  - SSL certificate for domain 
  - CRON task for automatically renew SSL
  - HTTP/2 (443 port)
  - Redirect from `www` to `non-www` domain 
  - Redirect from `http` to `https`
  - A folder for website files (`/var/www/<domain>/html`)

**Tested to work:**

- Ubuntu `18.04+ LTS`, `16.04+ LTS`
- Debian `10 (Buster)`, `9 (Stretch)`

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [PR](https://github.com/truewebartisans/useful-playbooks/pulls).

<br/>

## 📺 Media

A list of articles and video lessons, where `useful-playbooks` is used:

- [✨ A practical guide to GitHub Actions: build & deploy a static 11ty website to remote virtual server after push](https://dev.to/koddr/automate-that-a-practical-guide-to-github-actions-build-deploy-a-static-11ty-website-to-remote-virtual-server-after-push-d19) by [Vic Shóstak](https://github.com/koddr) @ 01 Jun 2020

> Make [pull requests](pulls) with links to your articles and videos! We will post them right here.

## ⭐️ Project assistance

If you want to say **thank you** or/and support active development `useful-playbooks`:

1. Add a :octocat: GitHub Star to the project.
2. Twit about project [on your Twitter](https://twitter.com/intent/tweet?text=Useful%20Ansible%20playbooks%20for%20easily%20deploy%20your%20website%20or%20webapp%20to%20absolutely%20fresh%20virtual%20server%20%28VDS%2FVPS%20or%20Droplet%29%20launched%20on%20GNU%2FLinux%20https%3A%2F%2Fgithub.com%2Ftruewebartisans%2Fuseful-playbooks).
3. Donate some money to project author via PayPal: [@paypal.me/koddr](https://paypal.me/koddr?locale.x=en_EN).
4. Join DigitalOcean at our [referral link](https://shrts.website/do/server) (your profit is **\$100** and we get \$25).
5. Buy awesome [domain name with **5%** discount](https://shrts.website/reg/domain) at REG.COM.

Thanks for your support! 😘 Together, we make this project better every day.

## ⚠️ License

MIT &copy; [Vic Shóstak](https://github.com/koddr) & [True web artisans](https://1wa.co/).
