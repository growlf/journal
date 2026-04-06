## What it is

In Ansible, **roles are a structured way to organize reusable automation logic**. A role encapsulates all the components needed to configure a particular piece of infrastructure – including tasks (the actual steps to perform), handlers (actions triggered by changes, like restarting a service), templates (dynamic configuration files), static files, variables, and default values – in a standardized directory layout. Roles allow you to **modularize your playbooks**, making them easier to read, maintain, and reuse across different projects or hosts. Instead of writing all tasks directly in a playbook, you reference a role in the playbook and optionally **override variables or defaults**, which makes modifying behavior simple without touching the role itself.

## Ansible Galaxy

Ansible Galaxy is the **community hub** for sharing and downloading roles and collections. Instead of writing everything from scratch, you can leverage existing automation.

Install roles from Galaxy:

```bash
# Install a role
ansible-galaxy install geerlingguy.nginx

# OR

# Install from requirements file
ansible-galaxy install -r requirements.yml
```

Example `requirements.yml`:

```yaml
# Install from Galaxy
- name: geerlingguy.nginx
  version: "2.8.0"

# Install from Git
- src: https://github.com/company/custom-role.git
  name: custom-role
```

Use Galaxy roles in playbooks:

```yaml
- hosts: webservers
  roles:
    - geerlingguy.nginx
    - custom-role
```

## Collections

Collections are **distribution packages** that can contain roles, modules, plugins, and other Ansible content. They provide a way to organize and distribute related automation content.

Install collections:

```bash
ansible-galaxy collection install community.general
ansible-galaxy collection install -r requirements.yml
```

Example collection requirements:

```yaml
collections:
  - name: community.general
    version: ">=3.0.0"
  - name: ansible.posix
```

## Example

```yaml
---
- name: Deploy customized nginx webserver
  hosts: webservers # A group defined in the inventory
  become: yes # Use elevated permissions

  roles:
    - role: nginx
      vars:
        nginx_port: 8080           # Override default HTTP port
        nginx_service_name: nginx   # Ensure correct service name
        index_message: "Welcome to Nginx!"  # Custom content for index page
```

### Nginx Role

#### 1. `defaults/main.yml` (defaults for all variables)

```yaml
---
nginx_port: 80
nginx_service_name: nginx
index_message: "Hello from Ansible!"   # Default index page message
```

---

#### 2. `templates/nginx.conf.j2` (uses overridden port)

```jinja2
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    server {
        listen {{ nginx_port }};
        server_name _;

        root /var/www/html;
        index index.html;

        location / {
            try_files $uri $uri/ =404;
        }
    }
}
```

---

#### 3. `tasks/main.yml` (dynamic content for index page)

```yaml
---
- name: Install nginx
  apt:
    name: "{{ nginx_service_name }}"
    state: present
    update_cache: yes

- name: Deploy nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: Restart nginx

- name: Deploy custom index page
  copy:
    content: "{{ index_message }}"
    dest: /var/www/html/index.html
    owner: www-data
    group: www-data
    mode: '0644'
```

---

#### 4. `handlers/main.yml`

```yaml
---
- name: Restart nginx
  service:
    name: "{{ nginx_service_name }}" #
    state: restarted
```