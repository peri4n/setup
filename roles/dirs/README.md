# The Dirs role

This role creates the entire directory structure in my home directory.

## Running the Dirs role

```
ansible-playbook main.yml --tags dirs
```

## My directory structure

```
├── .config
├── dev # private devlopment
|   ├── data
|   ├── envs
|   ├── tmp
|   ├── tools
|   └── repos
├── work # paid devlopment
|   ├── data
|   ├── envs
|   ├── tmp
|   ├── tools
|   ├── repos
|   └── docs # word documents
|        ├── notes
|        ├── orga
|        ├── papers
|        ├── templates
|        └── wiki
└── docs # documents
    ├── notes
    ├── orga
    ├── papers
    ├── templates
    └── wiki
```
