[![Build Status](https://travis-ci.org/peri4n/setup.svg?branch=master)](https://travis-ci.org/peri4n/setup)

# My Development Setup

Have you ever switched you laptop and it took you 2 days, maybe even weeks, to setup you new system? I have been there, in fact I have
been there so often, that at one time I started to automate the process. This repository is the result of this work.

## General structure

Each function I need to work in a productive way, is set up by an [Ansible][1] role. 

The roles I maintain are:

- [Base](roles/base/README.md)
- [Desktop](roles/desktop/README.md)
- [Dirs](roles/dirs/README.md)
- Dotfiles
- Fonts
- Mail
- ZSH

## How to use it.

To setup the entire environment you run either run:

```
ansible-playbook main.yml
```

Or execute a specific role using:

```
ansible-playbook main.yml --tags desktop
```

## Feedback

Positive and negative feedback is always more than welcome. If you need help, send me an [email](mailto:bull.fabian@googlemail.com).
It may take some time but I promise to answer.

## Contributing

This repository is not primarily meant for other people to be useful but it would be awesome if it is. When you think you have a 
great feature to add or found a bug, just open a pull request or an issue.

[1]: https://www.ansible.com

