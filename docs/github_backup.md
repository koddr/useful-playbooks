# [←](https://github.com/truewebartisans/useful-playbooks) 📖 `github_backup` playbook

Automate a backup process of your GitHub accounts (repositories, gists, organizations).

> ☝️ Please note, it's not a simple `git clone` command! This playbook make a **full backup** of all history, commits, pull-requests and releases of your repository. It was possible thanks to [python-github-backup](https://github.com/josegonzalez/python-github-backup) package.

## Usage

```bash
ansible-playbook \
                  github_backup-playbook.yml \
                  --user <USER> \
                  --extra-vars "host=<HOST>"
```

### Extra vars

- `<USER>` (**required**) remote user's username (for example, `root`)
- `<HOST>` (**required**) hostname in your inventory (from `/etc/ansible/hosts` file)

> 👌 Yes, actually you can specify the `<USER>` argument in your inventory file (`/etc/ansible/hosts`) and do not place it here. We use the `{{ ansible_user }}` variable in playbook to point to the remote user.

### Additional configuration

Please, create a `.env` file with the following structure (where this playbook is located):

```ini
# GitHub users or organizations login names, separated with commas (without spaces).
USERS=user123,org123

# GitHub personal access token.
# Generate it here: https://github.com/settings/tokens
GITHUB_TOKEN=0000000000000000000000000

# Max count of a saved backup files.
MAX_BACKUPS=10

# Time to delay.
# - d: days
# - h: hours
# - m: minutes
# - s: seconds
DELAY_TIME=1d

# Timezone for DELAY_TIME.
# See: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
TIME_ZONE=America/Chicago
```

> ☝️ This is required, because the Docker image uses these environment variables.

## Features

- Playbook uses a configured Docker image to create a container ([koddr/github-backup-automation](https://github.com/koddr/github-backup-automation)).
- You can set your own configuration (in `.env` file or inline variables) to:
  - Timezone and interval to run the backup process.
  - Count of a saved backup archives.
- Backups are compressed with gzip (`tar.gz`).
- Backups are stored in a folder named by date and time of creation.
- Older archives will be removed automatically.

## Tested to work

- All major systems (macOS, Linux, Windows), where installed Docker `19.03.x` (and later).

> 😉 Hey, if you have tested other versions and/or OS, please write [issue](https://github.com/truewebartisans/useful-playbooks/issues/new) or send [pull request](https://github.com/truewebartisans/useful-playbooks/pulls).

## 📺 Media

A list of articles and video lessons, where `github_backup` playbook is used:

- [☕️ Let's automate a backup process of your GitHub accounts, organizations & repositories](https://dev.to/koddr/let-s-automate-a-backup-process-of-your-github-accounts-organizations-repositories-46nd) @ 21 July 2020

> Make [pull request](https://github.com/truewebartisans/useful-playbooks/pulls) with links to your articles and videos! We will post them right here.

<br/>

[← Back to List](https://github.com/truewebartisans/useful-playbooks#-available-playbooks)
