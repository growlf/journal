## What it is

An Ansible playbook is a structured way to automate IT tasks across multiple servers or devices. At a high level, a playbook is a YAML file that defines plays, which map hosts (servers) to the tasks that should be executed on them. Each play targets one or more hosts defined in your inventory, and tasks within a play are executed sequentially. Playbooks allow administrators to declare the desired state of systems (like installing packages, creating users, or configuring files) rather than writing scripts with imperative instructions. This approach ensures idempotency, meaning that running the playbook multiple times does not create unintended side effects—only changes needed to reach the desired state are applied.

Playbooks also provide modularity, reuse, and readability. They can include variables, loops, conditional execution, roles, and handlers, allowing complex operations to be broken into reusable components. For example, you can define default variables for different environments, use templates to dynamically configure files, or trigger handlers (like restarting a service) only when a change occurs. Additionally, playbooks support integration with vaults for secure secret management, tags for selective execution, and notification modules for alerting. At scale, playbooks serve as the backbone of configuration management, allowing teams to manage hundreds or thousands of servers consistently and reliably.

## Example

```yml
---
# ==================================================
# Example Ansible Playbook with Detailed Comments
# Purpose: Demonstrates most common features with explanations
# ==================================================

# Define a play
- name: Configure Ubuntu servers
  hosts: all  # This play applies to all hosts in your inventory. Can also specify a group.
  become: yes # Escalate privileges (use sudo) to perform tasks that require root access
  gather_facts: yes # Collect system information like OS version, memory, network interfaces, etc.
  tags: [configuration]  # Allow selective execution with --tags configuration

  # ==================================================
  # Variables
  # ==================================================
  vars:
    # Admin user settings
    admin_user: "admin" # The name of the administrative user to create
    # Password hashed using sha512 (never store plaintext passwords)
    admin_password: "{{ 'SuperSecret123!' | password_hash('sha512') }}"
    # Public SSH key to allow key-based login
    ssh_pub_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
    # System timezone
    timezone: "UTC"
    # List of packages to install
    packages:
      - git
      - htop
      - curl
    # Flatpak applications to install
    flatpaks:
      - org.gnome.Calculator
      - com.spotify.Client

  # ==================================================
  # Handlers
  # ==================================================
  # Handlers are only triggered by a 'notify' from a task.
  # Example: Only restart a service if its configuration changes.
  handlers:
    - name: Restart SSH service
      service:
        name: ssh
        state: restarted  # Ensures SSH service restarts to apply any changes

    - name: Restart nginx
      service:
        name: nginx
        state: restarted  # Restarts nginx only when notified by a task

  # ==================================================
  # Tasks
  # ==================================================
  tasks:

    # -----------------------------
    # Task 1: Install packages
    # -----------------------------
    - name: Install essential packages
      apt:
        name: "{{ packages }}"  # Install all packages listed in the 'packages' variable
        state: latest           # Ensure the newest version is installed
        update_cache: yes       # Run 'apt update' before installing packages
      tags: [packages]          # Can run only this task using --tags packages

    # -----------------------------
    # Task 2: Create an admin user
    # -----------------------------
    - name: Create admin user
      user:
        name: "{{ admin_user }}"   # Username from variable
        password: "{{ admin_password }}"  # Hashed password
        groups: sudo               # Add user to the sudo group for admin privileges
        state: present             # Ensure user exists
        shell: /bin/bash           # Default shell for the user

    # -----------------------------
    # Task 3: Add SSH key for admin user
    # -----------------------------
    - name: Add SSH public key for admin
      authorized_key:
        user: "{{ admin_user }}"   # Add key for this user
        key: "{{ ssh_pub_key }}"   # Public key to allow passwordless login
        state: present             # Ensure key is present

    # -----------------------------
    # Task 4: Configure timezone
    # -----------------------------
    - name: Configure system timezone
      timezone:
        name: "{{ timezone }}"     # Set system timezone to variable value

    # -----------------------------
    # Task 5: Template a configuration file
    # -----------------------------
    - name: Deploy custom configuration
      template:
        src: templates/myapp.conf.j2   # Source Jinja2 template on control node
        dest: /etc/myapp.conf          # Destination path on target server
        owner: root                    # File owner
        group: root                    # File group
        mode: '0644'                   # File permissions
      notify: Restart nginx             # Notify handler to restart nginx if template changes

    # -----------------------------
    # Task 6: Conditional task
    # -----------------------------
    - name: Install Docker if Ubuntu 24.04
      apt:
        name: docker.io
        state: present
      when: ansible_facts['distribution_version'] == '24.04'
      # This task runs only if the system version is Ubuntu 24.04

    # -----------------------------
    # Task 7: Loop example for Flatpaks
    # -----------------------------
    - name: Install flatpaks
      flatpak:
        name: "{{ item }}"       # Install each item in the loop
        state: present
      loop: "{{ flatpaks }}"     # Loop over the 'flatpaks' list

    # -----------------------------
    # Task 8: Error handling example
    # -----------------------------
    - name: Attempt to start optional service
      service:
        name: optional-service
        state: started
      ignore_errors: yes  # Continue even if this task fails
      register: service_result

    - name: Report service status
      debug:
        msg: "Service started successfully"
      when: service_result is succeeded

    # -----------------------------
    # Task 9: Debugging / Info
    # -----------------------------
    - name: Show debug message
      debug:
        msg: "Admin user {{ admin_user }} setup successfully on {{ ansible_facts['hostname'] }}"
      # Useful for confirming tasks ran correctly

    # -----------------------------
    # Task 10: Example of using retries
    # -----------------------------
    - name: Wait for network service (with retries)
      uri:
        url: http://localhost:80
        status_code: 200
      register: result
      retries: 5              # Retry up to 5 times
      delay: 10               # Wait 10 seconds between retries
      until: result.status == 200
      # Ensures a service is ready before continuing

# ==================================================
# End of playbook
# ==================================================

```

> [!info] You can include multiple plays in a playbook by separating them with
> 
> ```
> ---  
> ```

## name

`name` is a playbook-level attribute that provides a **human-readable description** of what the entire playbook does. This appears in the output when the playbook runs and helps with documentation and logging.

```yaml
name: "Deploy web application and configure load balancer"
```

## hosts

`hosts` specifies **which inventory hosts or groups** the playbook should target. This is a required field that determines where the tasks will be executed. You can target individual hosts, groups, or use patterns.

```yaml
hosts: webservers
```

Multiple groups:

```yaml
hosts: webservers,dbservers
```

Individual hosts:

```yaml
hosts: server1.example.com,server2.example.com
```

All hosts:

```yaml
hosts: all
```

Pattern matching:

```yaml
hosts: web*.example.com
```

## become

`become` is a variable/option which tells ansible to run with **elevated permissions**. It can be added to playbooks, hosts/groups in the inventory, and even individual tasks. It is a boolean true/false value.

YAML example:

```yaml
become: true
```

ini example:

```ini
become=true
```

### become_method

`become_method` defines which **privilege escalation tool** to use. Common methods include `sudo`, `su`, `pbrun`, `pfexec`, `doas`, etc. The default is `sudo` on most systems.

YAML example:

```yaml
become: true
become_method: sudo
```

INI example:

```ini
become=true
become_method=sudo
```

### become_user

`become_user` specifies **which user account** to escalate privileges to. By default, this is `root`. You can override it to run tasks as any other system account.

YAML example:

```yaml
become: true
become_user: postgres
```

INI example:

```ini
become=true
become_user=postgres
```

### become_flags

`become_flags` lets you pass **custom command-line arguments** to the privilege escalation method. For instance, with `sudo` you might want to preserve environment variables or request a login shell.

YAML example:

```yaml
become: true
become_flags: "-H -S"
```

INI example:

```ini
become=true
become_flags=-H -S
```

### become_exe

`become_exe` sets the **binary path** of the privilege escalation program instead of relying on the default lookup. This is useful when the escalation tool is not in the standard path or has a non-default name.

YAML example:

```yaml
become: true
become_method: sudo
become_exe: /usr/local/bin/sudo
```

INI example:

```ini
become=true
become_method=sudo
become_exe=/usr/local/bin/sudo
```

## gather_facts

`gather_facts` is a playbook-level boolean option that controls whether Ansible automatically collects system information (facts) about target hosts before executing tasks. By default, this is `true`. When disabled, it can significantly speed up playbook execution.

YAML example:

```yaml
gather_facts: false
```

And in ini like this:

```ini
gather_facts=false
```

## Includes and Imports

Organize your playbooks by **splitting tasks into separate files**. This helps with organization, reusability, and maintainability. There are two main approaches: includes (dynamic, processed during execution) and imports (static, processed during parsing).

### include_tasks (Dynamic Loading)

Tasks are included dynamically at runtime, which allows for conditional inclusion and variable file names:

```yaml
# Main playbook tasks
tasks:
  - name: Include OS-specific tasks  
    include_tasks: "{{ ansible_os_family }}.yml"
    # This will include RedHat.yml on CentOS/RHEL or Debian.yml on Ubuntu
    
  - name: Include environment-specific configuration
    include_tasks: "{{ environment }}_config.yml"
    when: environment is defined
    # Only include if environment variable is set
    
  - name: Include optional monitoring setup
    include_tasks: monitoring.yml
    when: enable_monitoring | default(false)
    # Conditionally include monitoring tasks

# Example: Including with variables
  - name: Setup database with custom parameters
    include_tasks: database_setup.yml
    vars:
      db_name: "myapp_{{ environment }}"
      db_port: "{{ custom_db_port | default(5432) }}"
      db_backup_enabled: true
    loop:
      - production
      - staging
    loop_control:
      loop_var: environment
```

Contents of `RedHat.yml`:

```yaml
# RedHat.yml - OS-specific tasks for RedHat family
---
- name: Install packages using yum/dnf
  yum:
    name: "{{ packages }}"
    state: present

- name: Start and enable firewalld
  service:
    name: firewalld
    state: started
    enabled: yes

- name: Configure SELinux context for web directory
  sefcontext:
    target: '/var/www/html(/.*)?'
    setype: httpd_exec_t
    state: present
```

Contents of `Debian.yml`:

```yaml
# Debian.yml - OS-specific tasks for Debian family  
---
- name: Update apt cache
  apt:
    update_cache: yes
    cache_valid_time: 3600  # Cache valid for 1 hour

- name: Install packages using apt
  apt:
    name: "{{ packages }}"
    state: present

- name: Start and enable ufw
  service:
    name: ufw
    state: started
    enabled: yes
```

#### Behavior
- `import_tasks` statements are processed during the parsing phase of the playbook, before execution begins. This means the tasks from the imported file are essentially "copied and pasted" into the main playbook structure at the start.
- Variables and conditions in `include_tasks` are evaluated at runtime, meaning their values can change based on prior tasks or runtime conditions.
- Tasks included this way are not visible when using `ansible-playbook --list-tasks` as they are not part of the initial parsed structure.
- Handlers defined within included tasks typically cannot be notified from outside the included block.
- Tags applied to `include_tasks` apply only to the `include_tasks` statement itself, not necessarily to the individual tasks within the included file unless explicitly defined within that file.


### import_tasks (Static Loading)

Tasks are imported statically during playbook parsing, which means they're always processed regardless of conditionals:

```yaml
tasks:
  # These tasks are always imported during playbook parsing
  - name: Import common setup tasks
    import_tasks: common-setup.yml
    
  - name: Import security hardening tasks  
    import_tasks: security.yml
    tags: [security]  # Tags apply to all imported tasks
    
  # Variables can be passed to imported tasks
  - name: Import application deployment tasks
    import_tasks: deploy-app.yml
    vars:
      app_name: "mywebapp"
      app_version: "2.1.0"
      deployment_strategy: "rolling"
```

Contents of `common-setup.yml`:

```yaml
# common-setup.yml - Common tasks for all hosts
---
- name: Create application user
  user:
    name: "{{ app_user | default('appuser') }}"
    system: yes
    shell: /bin/false
    home: "/opt/{{ app_name | default('myapp') }}"
    create_home: yes

- name: Create application directories
  file:
    path: "{{ item }}"
    state: directory
    owner: "{{ app_user | default('appuser') }}"
    group: "{{ app_user | default('appuser') }}"
    mode: '0755'
  loop:
    - "/opt/{{ app_name | default('myapp') }}/bin"
    - "/opt/{{ app_name | default('myapp') }}/config"
    - "/var/log/{{ app_name | default('myapp') }}"

- name: Install common system packages
  package:
    name: "{{ common_packages }}"
    state: present
  vars:
    common_packages:
      - curl
      - wget  
      - unzip
      - htop
      - rsync
```

#### Behavior
- `import_tasks` statements are processed during the parsing phase of the playbook, before execution begins. This means the tasks from the imported file are essentially "copied and pasted" into the main playbook structure at the start.
- Variables and conditions in import_tasks are evaluated at parsing time.
- Tasks imported this way are visible when using commands like ansible-playbook --list-tasks.
- Handlers defined within imported tasks can be notified from other parts of the playbook.
- Tags applied to import_tasks apply to all tasks within the imported file.

### import_playbook (Modular Playbooks)

Import entire playbooks to create modular, organized automation:

```yaml
# site.yml - Master playbook that orchestrates everything
---
# Common setup for all hosts
- import_playbook: common.yml

# Infrastructure components  
- import_playbook: database.yml
- import_playbook: webservers.yml
- import_playbook: loadbalancer.yml

# Application deployment
- import_playbook: application.yml

# Monitoring and maintenance
- import_playbook: monitoring.yml
```

Example modular playbooks:

`database.yml`:

```yaml
# database.yml - Database server configuration
---
- name: Configure database servers
  hosts: databases
  become: yes
  
  vars:
    postgresql_version: "13"
    postgresql_data_dir: "/var/lib/postgresql/{{ postgresql_version }}/main"
    
  tasks:
    - name: Import database installation tasks
      import_tasks: tasks/postgresql-install.yml
      
    - name: Import database configuration tasks  
      import_tasks: tasks/postgresql-config.yml
      
    - name: Import database backup tasks
      import_tasks: tasks/postgresql-backup.yml
      when: backup_enabled | default(true)
```

`webservers.yml`:

```yaml
# webservers.yml - Web server configuration
---  
- name: Configure web servers
  hosts: webservers
  become: yes
  
  vars:
    nginx_worker_processes: "{{ ansible_processor_vcpus }}"
    nginx_worker_connections: 1024
    
  roles:
    - nginx
    - php-fpm
    
  tasks:
    - name: Include SSL certificate setup
      include_tasks: tasks/ssl-setup.yml
      when: ssl_enabled | default(false)
      
    - name: Include virtual host configuration
      include_tasks: tasks/vhost-config.yml
      loop: "{{ virtual_hosts }}"
      loop_control:
        loop_var: vhost
```

### include_vars (Dynamic Variable Loading)

Load variables from files dynamically:

```yaml
- name: Load environment-specific variables
  include_vars: "vars/{{ environment }}.yml"
  when: environment is defined

- name: Load secret variables from vault
  include_vars: "vault/{{ inventory_hostname }}.yml"
  
# Load variables with error handling
- name: Load optional configuration
  include_vars: "configs/optional.yml"
  ignore_errors: yes  # Don't fail if file doesn't exist

# Load variables with custom naming
- name: Load database configuration
  include_vars:
    file: "configs/database.yml"
    name: db_config  # Variables will be in db_config dictionary
```

### Key Differences: include vs import

|Feature|include_tasks|import_tasks|
|---|---|---|
|**Processing**|Runtime (dynamic)|Parse time (static)|
|**Conditionals**|Can be conditional|Always processed|
|**Variables**|Can use runtime variables in filename|Must use static filenames|
|**Loops**|Can be used in loops|Cannot be used in loops|
|**Tags**|Applied individually|Applied to all tasks|
|**Performance**|Slight runtime overhead|Better performance|
|**Use Case**|Dynamic, conditional inclusion|Static, always-needed tasks|

### Best Practices for Organization

```yaml
# Recommended file structure for includes/imports
playbooks/
├── site.yml                # Master playbook
├── webservers.yml          # Web server playbook  
├── databases.yml           # Database playbook
├── tasks/
│   ├── common/
│   │   ├── users.yml       # User management tasks
│   │   ├── packages.yml    # Package installation
│   │   └── security.yml    # Security hardening
│   ├── nginx/
│   │   ├── install.yml     # Nginx installation
│   │   ├── config.yml      # Nginx configuration  
│   │   └── ssl.yml         # SSL setup
│   └── database/
│       ├── postgresql.yml  # PostgreSQL setup
│       └── mysql.yml       # MySQL setup
├── vars/
│   ├── development.yml     # Dev environment vars
│   ├── staging.yml         # Staging environment vars  
│   └── production.yml      # Production environment vars
└── handlers/
    ├── common.yml          # Common handlers
    └── webserver.yml       # Web server handlers
```

Example of using this structure:

```yaml
# webservers.yml
---
- name: Configure web servers
  hosts: webservers
  become: yes
  
  tasks:
    - name: Import common user setup
      import_tasks: tasks/common/users.yml
      
    - name: Import common package installation
      import_tasks: tasks/common/packages.yml
      
    - name: Include environment-specific variables
      include_vars: "vars/{{ environment | default('development') }}.yml"
      
    - name: Import nginx installation and configuration
      import_tasks: tasks/nginx/install.yml
      
    - name: Configure nginx based on environment  
      import_tasks: tasks/nginx/config.yml
      
    - name: Setup SSL certificates if enabled
      include_tasks: tasks/nginx/ssl.yml
      when: ssl_enabled | default(false)
      
  handlers:
    - import_tasks: handlers/webserver.yml
```


## tasks

`tasks` is a list that contains the actual work to be performed by the playbook. Each task is a YAML dictionary that defines what action to take. Tasks are executed sequentially on each host.

```yaml
tasks:
  - name: Install nginx
    apt:
      name: nginx
      state: present
```

### name

`name` provides a **human-readable description** of what a task does. This appears in the output when the playbook runs, making it easier to follow execution progress and debug issues.

**Example:**

```yaml
- name: "Ensure nginx is installed and running"
  service:
    name: nginx
    state: started
```

### action

`action` specifies the **Ansible module** to execute and its parameters. While you can use the `action` keyword explicitly, it's more common to use the module name directly as the key.

YAML example using action keyword:

```yaml
- name: Copy configuration file
  action: copy src=nginx.conf dest=/etc/nginx/nginx.conf
```

More common YAML format:

```yaml
- name: Copy configuration file
  copy:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf
```

### state

Desired state for resources. Common values include `present`, `absent`, `started`, `stopped`, `restarted`, `latest`. However, different modules have different values.

```yaml
- name: "Ensure service is running"
  service:
    name: nginx
    state: started     # started, stopped, restarted
    enabled: true      # Enable at boot

- name: "Ensure package is installed"
  package:
    name: vim
    state: present     # present, absent, latest
```

### force

Forces operations that might otherwise be skipped or fail due to existing conditions.

```yaml
- name: "Force reinstall package"
  package:
    name: myapp
    state: present
    force: true        # Reinstall even if already present

- name: "Force overwrite file"
  copy:
    src: config.txt
    dest: /etc/config.txt
    force: true        # Overwrite even if dest is newer
```

### backup

Creates backup of files before modification.

```yaml
- name: "Update configuration with backup"
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^#?PermitRootLogin'
    line: 'PermitRootLogin no'
    backup: true       # Creates timestamped backup file
```

### validate

Command to validate file before finalizing changes. If validation fails, changes are rolled back.

```yaml
- name: "Update nginx configuration"
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
    validate: 'nginx -t -c %s'  # Test config before applying
    backup: true
  notify: restart nginx
```

### Additional Information

> [!info] There are a bunch of sysadmin operations included as builtin actions and even more from the community collection. If it's a relatively simple operation it's likely to exist as an action. Actions can be found in [[#Resources]].

### check_mode

Controls whether task runs in check mode (dry-run). Can force tasks to run or skip in check mode.

```yaml
- name: "Always gather info even in check mode"
  command: /usr/bin/get-system-info
  check_mode: false  # Run even during --check

- name: "Skip this task in check mode"
  command: /usr/bin/make-changes
  check_mode: true   # Always skip this task
```

### diff

Shows before/after differences for tasks that support it (copy, template, lineinfile, etc.).

```yaml
- name: "Update configuration with diff output"
  template:
    src: app.conf.j2
    dest: /etc/app/app.conf
  diff: true  # Show what changed in the file
```

### throttle

Limits number of hosts executing task concurrently. Useful for resource-intensive operations.

```yaml
- name: "Database migration (limit concurrency)"
  command: /usr/bin/migrate-database
  throttle: 2  # Only run on 2 hosts at a time
```

### run_once

Executes task only once across all hosts in play, typically on first host.

```yaml
- name: "Download shared file once"
  get_url:
    url: "https://example.com/shared-file.tar.gz"
    dest: /tmp/shared-file.tar.gz
  run_once: true  # Download only once, not on every host
```

### delegate_to

Runs task on specified host instead of current target host.

```yaml
- name: "Update load balancer from web servers"
  uri:
    url: "http://{{ load_balancer }}/api/remove-server"
    method: POST
    body: "server={{ inventory_hostname }}"
  delegate_to: localhost  # Run API call from Ansible controller

- name: "Copy file between servers"
  copy:
    src: /tmp/data.txt
    dest: /backup/data.txt
  delegate_to: "{{ backup_server }}"  # Copy to backup server
```

#### delegate_facts

Controls where facts are assigned when using delegation. Only applicable with `delegate_to`.

```yaml
- name: "Gather facts about database server"
  setup:
  delegate_to: "{{ database_server }}"
  delegate_facts: true  # Assign facts to database_server, not current host
```

### local_action

Shorthand for `delegate_to: localhost`. Runs task on Ansible control machine.

```yaml
- name: "Create local backup directory"
  local_action:
    module: file
    path: "/local/backups/{{ inventory_hostname }}"
    state: directory

# Equivalent to:
- name: "Create local backup directory"
  file:
    path: "/local/backups/{{ inventory_hostname }}"
    state: directory
  delegate_to: localhost
```

### connection

Specifies connection plugin for task execution.

```yaml
- name: "Run command locally"
  command: echo "Running locally"
  connection: local

- name: "Use specific SSH connection"
  command: whoami
  connection: ssh
```

### remote_user

Overrides default remote user for task execution.

```yaml
- name: "Run as database user"
  command: psql -c "SELECT version()"
  remote_user: postgres
```

### register

`register` **captures the output** of a task into a variable that can be used in subsequent tasks. The registered variable contains information like return codes, stdout, stderr, and module-specific data.

**Example:**

```yaml
- name: Check if file exists
  stat:
    path: /etc/myapp/config.yml
  register: config_file_stat

- name: Create config if missing
  template:
    src: config.yml.j2
    dest: /etc/myapp/config.yml
  when: not config_file_stat.stat.exists
```

### when

`when` provides **conditional execution** of tasks based on facts, variables, or results from previous tasks. The condition is evaluated as a Jinja2 expression.

**Example:**

```yaml
- name: Install package on Ubuntu only
  apt:
    name: nginx
    state: present
  when: ansible_distribution == "Ubuntu"
```

### until

`until` creates a **retry loop** that repeats a task until a specified condition is met. It's commonly used with the `retries` and `delay` parameter which limit the number of attempts and specifies time between attempts respectively.

**Example:**

```yaml
- name: Wait for service to be ready
  uri:
    # Perform an HTTP request to the health check endpoint of the service
    url: "http://{{ inventory_hostname }}:8080/health"
    status_code: 200   # Expect HTTP 200 OK response
  register: health_check  # Save the result in the variable 'health_check'
  # Keep retrying until the condition is met
  until: health_check.status == 200  # Success when the status is 200
  retries: 5   # Maximum number of attempts
  delay: 10    # Wait 10 seconds between retries

```

### loops

#### Item loop

`loop` allows a task to be **executed multiple times** with different values. It replaces the older `with_*` constructs and provides a more consistent syntax for iteration.

**Example:**

```yaml
- name: Create multiple users
  user:
    name: "{{ item }}"
    state: present
  loop:
    - alice
    - bob
    - charlie
```

#### loop_control

Controls loop behavior including variable names, pausing, and labeling for cleaner output. Only applicable when using `loop`.

```yaml
- name: "Process users with custom loop variable"
  user:
    name: "{{ user_item.name }}"
    group: "{{ user_item.group }}"
  loop: "{{ users }}"
  loop_control:
    loop_var: user_item  # Avoid conflicts with nested loops
    pause: 2             # Pause 2 seconds between iterations
    label: "{{ user_item.name }}"  # Cleaner output display
```

#### Additional Information
> [!info] Other information about loops can be found in [[#resources]].

### Blocks

Blocks allow you to **group tasks together** and apply common attributes like error handling:

```yaml
- name: Configure web server
  block:
    - name: Install nginx
      apt:
        name: nginx
        state: present

    - name: Start nginx
      service:
        name: nginx
        state: started
  rescue:
    - name: Handle installation failure
      debug:
        msg: "Failed to configure web server"
  always:
    - name: Ensure firewall is configured
      ufw:
        rule: allow
        port: 80
```

### Error Handling

Ansible provides several mechanisms for **handling errors and controlling task behavior**. By default, if a task fails on a host, Ansible stops executing tasks for that host. These mechanisms give you fine-grained control over how failures are handled.

#### ignore_errors

Continue playbook execution on a host even if a task fails. The task failure is noted but doesn't prevent subsequent tasks from running:

```yaml
- name: Attempt to start optional service
  service:
    name: optional-monitoring-service
    state: started
  ignore_errors: yes  # Continue even if service doesn't exist or fails to start
  register: optional_service_result

- name: Report optional service status
  debug:
    msg: >
      Optional service status: 
      {{ 'Started successfully' if optional_service_result.failed == false 
         else 'Failed to start: ' + optional_service_result.msg }}
```

#### failed_when

Define **custom failure conditions** instead of relying on the module's built-in failure detection. This is useful when a command returns non-zero exit codes that are actually acceptable:

```yaml
- name: Check application health endpoint
  uri:
    url: "http://{{ inventory_hostname }}:8080/health"
    method: GET
    status_code: [200, 503]  # Accept both healthy and maintenance status
  register: health_check
  # Custom failure condition - fail only if we can't connect at all
  failed_when: 
    - health_check.status is not defined
    - health_check.msg is search("Connection refused")

- name: Run database migration
  command: /opt/myapp/bin/migrate --dry-run
  register: migration_check
  # Don't fail if there are no migrations to run
  failed_when: 
    - migration_check.rc != 0 
    - "'No migrations needed' not in migration_check.stdout"

- name: Check disk space
  shell: df -h / | awk 'NR==2 {print $5}' | sed 's/%//'
  register: disk_usage
  # Fail if disk usage is above 90%
  failed_when: disk_usage.stdout | int > 90
```

#### changed_when

Control when a task reports "changed" status. This is important for idempotency and preventing unnecessary handler notifications:

```yaml
- name: Check if system reboot is required  
  stat:
    path: /var/run/reboot-required
  register: reboot_required_file
  # This task never reports as "changed" since it's just checking
  changed_when: false

- name: Run application health check
  command: /opt/myapp/bin/healthcheck
  register: health_result
  # Only report changed if the health status actually changed
  changed_when: "'status changed' in health_result.stdout"

- name: Ensure log rotation configuration
  lineinfile:
    path: /etc/logrotate.d/myapp
    line: "/var/log/myapp/*.log { daily rotate 7 }"
    regexp: "^/var/log/myapp/"
    create: yes
  register: logrotate_result
  # Custom logic for when this is considered "changed"
  changed_when:
    - logrotate_result.changed
    - logrotate_result.msg is not search("line already exists")

# Example: Command that always returns success but we want to detect actual changes  
- name: Update application cache
  command: /opt/myapp/bin/update-cache --check-modified
  register: cache_update
  # Parse command output to determine if changes were made
  changed_when: "'Cache updated' in cache_update.stdout"
  failed_when: cache_update.rc != 0
```

#### ignore_unreachable

Continues execution when hosts become unreachable during task execution.

```yaml
- name: "Reboot servers (may become unreachable)"
  reboot:
  ignore_unreachable: true
```

#### Combining Error Handling Strategies

Real-world tasks often need multiple error handling strategies:

```yaml
- name: Deploy application with comprehensive error handling
  block:
    - name: Stop application gracefully
      service:
        name: myapp
        state: stopped
      # Don't fail if app is already stopped
      failed_when: false
      register: app_stop
      
    - name: Backup current application
      command: tar -czf /backup/myapp-{{ ansible_date_time.epoch }}.tar.gz /opt/myapp
      # Don't fail deployment if backup fails, but log it
      ignore_errors: yes
      register: backup_result
      
    - name: Deploy new application version  
      unarchive:
        src: "/tmp/myapp-{{ app_version }}.tar.gz"
        dest: /opt/myapp
        remote_src: yes
        owner: appuser
        group: appgroup
      register: deploy_result
      # Custom failure detection for deployment
      failed_when:
        - deploy_result.failed
        - "'Permission denied' in deploy_result.msg"
        
    - name: Verify deployment integrity
      command: /opt/myapp/bin/verify-installation
      register: verify_result
      # Only consider it changed if verification passed
      changed_when: 
        - verify_result.rc == 0
        - "'Installation verified' in verify_result.stdout"
      # Fail if verification returns specific error codes
      failed_when: verify_result.rc in [1, 2, 5]  # 3,4 are warnings, not failures
      
    - name: Start application
      service:
        name: myapp
        state: started
        enabled: yes
      # Allow some time for startup
      retries: 3
      delay: 10
      
  rescue:
    # Run if any task in the block fails
    - name: Rollback on deployment failure
      debug:
        msg: "Deployment failed, initiating rollback procedure"
        
    - name: Restore from backup
      command: tar -xzf /backup/myapp-backup.tar.gz -C /
      when: backup_result is succeeded
      ignore_errors: yes
      
  always:
    # Always runs, regardless of success or failure
    - name: Cleanup temporary files
      file:
        path: "/tmp/myapp-{{ app_version }}.tar.gz"
        state: absent
        
    - name: Send deployment notification
      mail:
        to: devops@company.com
        subject: "Deployment {{ '## Folder Structure
So first off, the folder structure (somethings can be moved but this structure is ideal).
## Tree
```

### Tags

Tags allow you to **selectively execute parts** of your playbooks without running everything. You can tag individual tasks, blocks, plays, or roles.

#### Example Usage

```yaml
tasks:
  - name: Install packages
    apt:
      name: "{{ packages }}"
      state: present
    tags: [packages, setup]

  - name: Configure firewall
    ufw:
      rule: allow
      port: 22
    tags: [security, firewall]
```

Run specific tags:

```bash
# Only run tasks tagged with 'packages'
ansible-playbook site.yml --tags packages

# Run multiple tags
ansible-playbook site.yml --tags "packages,security"

# Skip specific tags
ansible-playbook site.yml --skip-tags firewall
```

### async

Runs task asynchronously without waiting for completion. Useful for long-running operations.

```yaml
- name: "Long running backup operation"
  command: /usr/bin/backup-script.sh
  async: 3600  # Maximum time to wait (seconds)
  poll: 0      # Don't poll for completion
  register: backup_job

- name: "Check backup job status later"
  async_status:
    jid: "{{ backup_job.ansible_job_id }}"
  register: backup_result
```

#### poll

Polling interval for async tasks. Only used with `async`. Set to 0 for "fire and forget" behavior.

```yaml
- name: "Start service and check every 10 seconds"
  service:
    name: myapp
    state: started
  async: 300
  poll: 10  # Check status every 10 seconds
```

## handlers

`handlers` are special tasks that only run when **notified by other tasks**. They're typically used for actions like restarting services after configuration changes. Handlers run once at the end of the play, even if notified multiple times.

```yaml
handlers:
  - name: restart nginx
    service:
      name: nginx
      state: restarted
```

### notify

`notify` is used within tasks to **trigger handler execution** when the task reports a "changed" status. Multiple tasks can notify the same handler, but the handler will only run once per play.

Single handler notification:

```yaml
tasks:
  - name: Update nginx config
    copy:
      src: nginx.conf
      dest: /etc/nginx/nginx.conf
    notify: restart nginx
```

Multiple handler notifications:

```yaml
tasks:
  - name: Update application config
    template:
      src: app.conf.j2
      dest: /etc/myapp/app.conf
    notify:
      - restart nginx
      - reload firewall
      - clear cache
```

Conditional notification:

```yaml
tasks:
  - name: Install security updates
    apt:
      upgrade: safe
      update_cache: yes
    notify: reboot server
    when: security_updates_required
```

### listen

`listen` allows handlers to **respond to topic-based notifications** instead of being called by name. This enables multiple handlers to respond to a single notification and makes handler management more flexible.

Handler with listen topic:

```yaml
handlers:
  - name: restart web services
    service:
      name: nginx
      state: restarted
    listen: "restart web stack"

  - name: reload php-fpm
    service:
      name: php-fpm
      state: reloaded
    listen: "restart web stack"

  - name: clear application cache
    file:
      path: /var/cache/myapp
      state: absent
    listen: "restart web stack"
```

Notifying listen topics:

```yaml
tasks:
  - name: Update web application code
    git:
      repo: https://github.com/company/webapp.git
      dest: /var/www/html
    notify: "restart web stack"
```

	Multiple listen topics:

```yaml
handlers:
  - name: restart database
    service:
      name: mysql
      state: restarted
    listen:
      - "database config changed"
      - "restart db services"
```

### Handler Loops

Handlers can use **loop constructs** just like regular tasks, allowing them to perform repetitive actions when notified.

Handler with simple loop:

```yaml
handlers:
  - name: restart multiple services
    service:
      name: "{{ item }}"
      state: restarted
    loop:
      - nginx
      - php-fpm
      - redis
    listen: "restart web services"
```

Handler with complex loop data:

```yaml
handlers:
  - name: restart application instances
    service:
      name: "{{ item.name }}"
      state: restarted
    loop:
      - { name: "app-instance-1", port: 8001 }
      - { name: "app-instance-2", port: 8002 }
      - { name: "app-instance-3", port: 8003 }
    listen: "restart app cluster"
```

Handler with conditional loop:

```yaml
handlers:
  - name: restart services based on configuration
    service:
      name: "{{ item }}"
      state: restarted
    loop: "{{ services_to_restart | default([]) }}"
    when: services_to_restart is defined and services_to_restart | length > 0
    listen: "conditional restart"
```

### Handler Execution Order

Handlers run in the **order they are defined** in the handlers section, not in the order they are notified. This is important for dependencies between handlers.

Ordered handler execution:

```yaml
handlers:
  - name: stop application
    service:
      name: myapp
      state: stopped
    listen: "deploy new version"

  - name: update application files
    unarchive:
      src: /tmp/myapp-v2.tar.gz
      dest: /opt/myapp
      remote_src: yes
    listen: "deploy new version"

  - name: start application
    service:
      name: myapp
      state: started
    listen: "deploy new version"
```

Force handler execution order with meta:

```yaml
tasks:
  - name: Critical configuration change
    template:
      src: critical.conf.j2
      dest: /etc/myapp/critical.conf
    notify: restart application
    
  - name: Force handler execution now
    meta: flush_handlers
    
  - name: Verify application is running
    uri:
      url: "http://localhost:8080/health"
      status_code: 200
```