# The Dirs role

This role creates the entire directory structure in my home directory.

## Running the Dirs role

```
ansible-playbook main.yml --tags desktop
```

## My directory structure

```
├── .config
├── dev
|   ├── work
|   |   ├── boxes
|   |   ├── envs
|   |   └── repos
|   └── private
|       ├── boxes
|       ├── envs
|       └── repos
└── docs
    ├── papers
    ├── templates
    └── wiki
```