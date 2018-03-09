# sawtooth-cloud-init

> Spin up a new Ubuntu + Hyperledger Sawtooth network on Digital Ocean

## Notes

* Placeholder values are delimited with `__double_underscores__`

## Getting started

1) Clone this repo

```bash
git clone https://github.com/thegreatsunra/sawtooth-cloud-init.git
```

2) [Generate an SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) if you don't have one already

```bash
ssh-keygen -t rsa -b 4096 -C "email@domain.tld"
```

3) Copy your SSH key [to your clipboard](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

```bash
pbcopy < ~/.ssh/id_rsa.pub
```

4) Open `scripts/01-cloud-init.example.txt` in a text editor and **save it as a new file named `01-cloud-init.txt`**

5) Replace the placeholder SSH key (around line 30) with the contents of your clipboard

```bash
      - ssh-rsa AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA== __email@domain.tld__
```

Be careful not to delete the indentation or `- ` at the beginning of the line, as `cloud-init` needs them to recognize the command

6) Search within `scripts/cloud-init.txt` and replace the following placeholder strings with your desired values:

* `__email@domain.tld__` - the email address of the primary admin user
* `__temporary_password_change_me_immediately__` - a temporary, throwaway password that will live forever on your server in your `cloud-init` script and **you will immediately change upon logging into the server**

7) Save `scripts/01-cloud-init.txt`, select all, and copy it to your clipboard

### Digital Ocean

1) Log in to Digital Ocean

2) Create a new droplet

3) Under "Select additional options" check the box for "User data" and paste in the contents of `scripts/01-cloud-init.txt`

4) If you want to create a multi-node Sawtooth validator network, increase the number under "How many droplets?" accordingly

5) Click "Create" and wait a few moments as Digital Ocean creates your new droplet

6) Once Digital Ocean finishes creating your droplet, copy the IP address for your droplet

### Prepare manual commands

1) Open `scripts/02-manual-commands.example.txt` in a text editor and **save it as a new file named `02-manual-commands.txt`**

2) Perform a search-and-replace on `scripts/02-manual-commands.txt`, and replace the following values with the values you used in your `cloud-init` script, and the values provided by Digital Ocean when creating your droplet

3) Save `scripts/02-manual-commands.txt`

4) Perform the above steps on `scripts/03-sawtooth-seed-commands.example.txt`, `scripts/03-sawtooth-seed-commands.example.txt`, and `scripts/04-sawtooth-commands.txt`

### SSH into your server

1) SSH into your new server (or one of your new servers) using the user `sawtooth` and the IP address provided by Digital Ocean

```bash
ssh sawtooth@__SERVER_IP__
```

2) Go line-by-line through `scripts/02-manual-commands.txt`, pasting each command into the Terminal to run it on your server like some kind of animal

3) Go line-by-line through `scripts/03-sawtooth-seed-commands.txt`, pasting each command into the Terminal

4) If you're creating a multi-node Sawtooth validator network, **log into another one of your servers** and go line-by-line through `scripts/03-sawtooth-peer-commands.txt`. Repeat this process for each (non-seed) server in your network

5) Finally, go line-by-line through `scripts/04-sawtooth-commands.txt`, pasting each command into the Terminal. Some of the commands you will run on each server in your Sawtooth validator network, while other commands you will only run on a single server

## License

The MIT License (MIT)

Copyright (c) 2018 Dane Petersen
