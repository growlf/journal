## What it is

Variables in Ansible provide a way to **store and reuse values** throughout your playbooks, making them more flexible and maintainable. Variables can be defined in multiple locations and have different scopes and precedence levels.

## Variable Definition Locations

Variables can be defined in **various locations** with different precedence levels. Ansible follows a specific order when multiple definitions exist for the same variable name.

Playbook level:

```yaml
vars:
  app_name: myapp
  app_version: "1.0.0"
```

Inventory level:

```ini
[webservers]
web1.example.com app_name=frontend
web2.example.com app_name=api
```

Host/Group vars files:

```yaml
# group_vars/webservers.yml
database_host: db.example.com
max_connections: 100
```

## Variable Types

Variables can contain **different data types** including strings, numbers, booleans, lists, and dictionaries, allowing for complex data structures.

String variables:

```yaml
vars:
  server_name: "production-web-01"
  environment: "production"
```

Numeric variables:

```yaml
vars:
  port_number: 8080
  max_memory: 2048
```

Boolean variables:

```yaml
vars:
  enable_ssl: true
  debug_mode: false
```

List variables:

```yaml
vars:
  packages:
    - nginx
    - mysql-server
    - redis
```

Dictionary variables:

```yaml
vars:
  database_config:
    host: "localhost"
    port: 5432
    name: "myapp_db"
    user: "app_user"
```

## Variable Referencing

Variables are referenced using **Jinja2 templating syntax** with double curly braces. This allows for dynamic content generation and conditional logic.

Basic variable reference:

```yaml
- name: "Install {{ package_name }}"
  apt:
    name: "{{ package_name }}"
    state: present
```

List item reference:

```yaml
- name: "Configure database connection to {{ database_config.host }}"
  template:
    src: db_config.j2
    dest: "/etc/myapp/database.conf"
```

Variable in conditionals:

```yaml
- name: "Enable firewall"
  ufw:
    state: enabled
  when: enable_firewall == true
```

## Facts

Facts are **automatically discovered variables** about the target systems that Ansible gathers during the fact collection phase. These provide information about the host's operating system, hardware, and network configuration.

Common facts usage:

```yaml
- name: "Install package for {{ ansible_distribution }}"
  package:
    name: "{{ package_name }}"
    state: present
  when: ansible_distribution == "Ubuntu"
```

Custom facts directory:

```yaml
- name: "Use custom fact"
  debug:
    msg: "Application version is {{ ansible_local.myapp.version }}"
```

## Magic Variables

Magic variables are **built-in variables** provided by Ansible that contain information about the current execution context, inventory, and other runtime details.

Inventory hostname:

```yaml
- name: "Configure service for {{ inventory_hostname }}"
  template:
    src: service.conf.j2
    dest: "/etc/service/{{ inventory_hostname }}.conf"
```

Group membership:

```yaml
- name: "Configure cluster nodes"
  template:
    src: cluster.conf.j2
    dest: /etc/cluster.conf
  vars:
    cluster_nodes: "{{ groups['dbservers'] }}"
```

Playbook directory:

```yaml
- name: "Copy files from playbook directory"
  copy:
    src: "{{ playbook_dir }}/files/config.yml"
    dest: /etc/myapp/config.yml
```

## Variable Precedence

Ansible follows a **specific precedence order** when the same variable is defined in multiple locations. Variables defined in locations with higher precedence will override those with lower precedence.

Precedence order (highest to lowest):

1. Extra vars (command line `-e`)
2. Task vars (in task definition)
3. Block vars
4. Role and include vars
5. Play vars
6. Host facts and registered vars
7. Host vars (inventory and host_vars files)
8. Group vars (inventory and group_vars files)
9. Role defaults

Example of precedence in action:

```yaml
# This task var will override any other definition
- name: "Override variable at task level"
  debug:
    msg: "Environment is {{ environment }}"
  vars:
    environment: "task-override"
```

## Variable Scoping

Variables have different **scope levels** that determine where they can be accessed within your Ansible execution.

Play scope:

```yaml
- hosts: webservers
  vars:
    play_var: "Available to all tasks in this play"
  tasks:
    - name: Use play variable
      debug:
        msg: "{{ play_var }}"
```

Task scope:

```yaml
- name: "Task with local variable"
  debug:
    msg: "{{ task_var }} only available in this task"
  vars:
    task_var: "local value"
```

Global scope (facts and magic variables):

```yaml
- name: "Access global inventory information"
  debug:
    msg: "Running on {{ inventory_hostname }} in group {{ group_names }}"
```

## vars

`vars` defines **variables** that can be used throughout the playbook. Variables can be defined at multiple levels (playbook, play, task) and can contain strings, numbers, lists, or dictionaries.

```yaml
vars:
  app_name: mywebapp
  app_port: 8080
  database_servers:
    - db1.example.com
    - db2.example.com
```

Variables can be referenced using Inline Jinja2 templating:

```yaml
- name: "Start {{ app_name }} service"
  service:
    name: "{{ app_name }}"
    state: started
```