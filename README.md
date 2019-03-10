[![Build Status](https://travis-ci.org/peri4n/setup.svg?branch=master)](https://travis-ci.org/peri4n/setup)

# My Development Setup

This is a set of Ansible scripts that sets up my entire development environment as well as all the stuff I need to work at a PC (e.g. Email).
My development setup contains stuff like:

- ZSH
- Java
- Ruby
- Python

Other things that are set up:

- Mail
- Newsreader
- IRC
- Fonts

## How to use it.

To setup the entire environment you run:

```
ansible-playbook main.yml
```

To execute a certain role execute something like:

```
ansible-playbook main.yml --tags terminfo
```

## How it works.

The environment is split into several Ansible roles. To have a look which roles are currently supporded, look into `main.yml`.
