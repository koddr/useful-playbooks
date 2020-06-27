# 🚚 Useful playbooks for easily deploy

<img align="right" width="96px" src=".github/logo.svg" alt="logo"/>

Useful [Ansible](https://github.com/ansible/ansible) playbooks for **easily** deploy your website or webapp to **absolutely** fresh virtual server (VDS/VPS or Droplet) launched on GNU/Linux. Only **3 minutes** from the playbook run to complete setup server and start it. **There you go! It just works**.

## ⚡️ Quick start

1. Download [ZIP archive](https://github.com/truewebartisans/useful-playbooks/archive/master.zip) or `git clone` this repository.
2. Go to the downloaded or cloned folder.
3. Select a playbook (see [`Available playbooks`](https://github.com/truewebartisans/useful-playbooks#-available-playbooks) section).
4. Run `<playbook_name>` with (_or without_) arguments and extra vars:

```console
ansible-playbook <playbook_name>-playbook.yml [args] [extra vars...]
```

5. Enjoy! 😎

## 📚 Available playbooks

- 📖 [`new_server`](https://github.com/truewebartisans/useful-playbooks/blob/master/docs/new_server.md) for auto configure a fresh remote virtual server
- 📖 [`install_brotli`](https://github.com/truewebartisans/useful-playbooks/blob/master/docs/install_brotli.md) for install Brotli module to Nginx
- 📖 [`create_ssl`](https://github.com/truewebartisans/useful-playbooks/blob/master/docs/create_ssl.md) for create a new website with SSL certificate from Let's Encrypt and auto renew

## 💡 Required information about Ansible

<details>
<summary>🤔 What is Ansible?</summary><br/>

Follow [Wikipedia](<https://en.wikipedia.org/wiki/Ansible_(software)>) page:

<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" width="128px" align="right" alt="ansible logo" />

_Ansible is an open-source software provisioning, configuration management, and application-deployment tool enabling infrastructure as code. It runs on many Unix-like systems, and can configure both Unix-like systems as well as Microsoft Windows. It includes its own declarative language to describe system configuration._

_Ansible was written by Michael DeHaan and acquired by Red Hat in 2015. Ansible is agentless, temporarily connecting remotely via SSH or Windows Remote Management (allowing remote PowerShell execution) to do its tasks._

</details>

<details>
<summary>👀 Why it's so good to use for me?</summary><br/>

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
<summary>🎯 How to work with Ansible and playbooks?</summary><br/>

1. Be sure, that [Python](https://www.python.org/) (version `3.5` or later) is installed.
2. Install Ansible for your OS by [this](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible) instructions.
3. Setting up inventory by [this](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html) guide.

</details>

<details>
<summary>✅ Helpful hints, tools and plugins for working with Ansible</summary><br/>

**VS Code addons:**

- [vscode-ansible](https://marketplace.visualstudio.com/items?itemName=vscoss.vscode-ansible) for code completion, syntax highlighting and linting of Ansible playbooks files
- [vscode-nginx](https://marketplace.visualstudio.com/items?itemName=shanoor.vscode-nginx) for syntax highlighting of Nginx configs

**VS Code config hints:**

For better readability, please add two association to your `.vscode/settings.json`:

1. For `Ansible` playbooks
2. For `jinja2` templates (which uses for `Nginx` configs)

```jsonc
{
  // ...
  "files.associations": {
    // ...
    "*-domain.j*2": "NGINX", // for all jinja2 files ended with `domain` word
    "*-playbook.y*ml": "ansible" // for YAML files ended with `playbook` word
  }
  // ...
}
```

**Beautify Ansible outputs:**

Since Ansible `v2.5.x` you can enable beautify output by [callback_plugins](https://docs.ansible.com/ansible/2.5/plugins/callback.html) and auto convert this _one line_ output:

```console
TASK [Get SSL for domain] *******************************
fatal: [174.138.47.165]: FAILED! => {"changed": true, "cmd": ["certbot", "--nginx", "certonly", "--agree-tos", "-m", "test@example.com", "-d", "example.com", "-d", "www.example.com", "--dry-run"], "delta": "0:00:05.308254", "end": "2020-06-27 10:29:26.506768", "msg": "non-zero return code", "rc": 1, "start": "2020-06-27 10:29:21.198514", "stderr": "..." ...
```

To awesome structured, like this:

```console
TASK [Get SSL for domain] *******************************
fatal: [174.138.47.165]: FAILED! => changed=true
  cmd:
  - certbot
  - --nginx
  - certonly
  - --agree-tos
  - -m
  - test@example.com
  - -d
  - example.com
  - -d
  - www.example.com
  - --dry-run
  delta: '0:00:05.231053'
  end: '2020-06-27 10:31:26.398114'
  msg: non-zero return code
  rc: 1
  start: '2020-06-27 10:31:21.167061'
  stderr: ...
  ...
```

To use it, please, edit your `ansible.cfg` file (_either global, in `/etc/ansible/ansible.cfg`, or a local one in your playbook/project_), and add the following lines under the `[defaults]` section:

```ini
[defaults]
stdout_callback = yaml       # Use the YAML callback plugin
bin_ansible_callbacks = True # Use the stdout_callback when running ad-hoc commands
```

</details>

## 📺 Media

A list of articles and video lessons, where `useful-playbooks` is used:

- [⚙️ How to install Brotli module for Nginx on Ubuntu 20.04+](https://dev.to/koddr/how-to-install-brotli-module-for-nginx-on-ubuntu-20-04-2ocp) @ 27 Jun 2020
- [✨ A practical guide to GitHub Actions: build & deploy a static 11ty website to remote virtual server after push](https://dev.to/koddr/automate-that-a-practical-guide-to-github-actions-build-deploy-a-static-11ty-website-to-remote-virtual-server-after-push-d19) @ 01 Jun 2020

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

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
