## What it is

When Ansible is run, it first looks for a configuration file in the current working directory, allowing project-specific settings to take precedence over system and user-wide defaults. At a high level, ansible.cfg controls how Ansible behaves, defining settings like the default inventory location, connection parameters, logging options, privilege escalation behavior, retry limits, and module paths. By customizing ansible.cfg, you can streamline task execution and connection management without repeatedly specifying options on the command line. Configuration can exist system-wide, per-user, or per-project, with project-level settings overriding others, providing flexible management for different environments.

## Configuration Precedence

Ansible follows a specific order when looking for configuration files, with each level overriding the previous one:

1. **ANSIBLE_CONFIG environment variable** - If this environment variable is set, Ansible uses the file it points to and ignores all other locations.
2. **ansible.cfg in the current directory** - Ansible checks for a configuration file in the directory where you run your ansible commands. This is ideal for project-specific settings.
3. **~/.ansible.cfg in the user's home directory** - User-specific configuration that applies across all projects for that user.
4. **/etc/ansible/ansible.cfg** - System-wide default configuration that applies to all users on the system.

## Example

```ini
# =============================
# Ansible Configuration File
# =============================

[defaults]
# Default location of your inventory file
inventory = ./inventory/hosts.ini

# Default module path if you have custom modules
library = ./library

# Retry failed tasks up to 3 times by default
retries = 3

# Enable fact caching to improve performance for large environments
fact_caching = jsonfile
fact_caching_connection = ./fact_cache
fact_caching_timeout = 86400   # cache timeout in seconds (1 day)

# Default privilege escalation method (sudo, su, etc.)
# become=True tells Ansible to use privilege escalation when needed
become = True
become_method = sudo
become_user = root

# Default timeout for SSH connections
timeout = 30

# Control number of parallel connections per host
# Default is 5, increase if needed
forks=5

# Enable detailed logging (log file location)
log_path = ./ansible.log

# Control how Ansible interprets Python on remote machines
interpreter_python = auto_silent

# Vault password file location (optional)
vault_password_file = ./.vault_pass

[ssh_connection]
# Control SSH behavior
# Use pipelining to improve performance
pipelining = True

# How long (in seconds) Ansible will wait before timing out a pipelined SSH connection.
pipelining_timeout = 30

# Extra SSH arguments:
# - ControlMaster=auto: Enables SSH connection sharing (reuse an existing connection if possible).
# - ControlPersist=60s: Keeps the SSH master connection open for 60 seconds after the last command,
#   reducing overhead for multiple tasks run in quick succession.
ssh_args = -o ControlMaster=auto -o ControlPersist=60s

# =============================
# End of Configuration
# =============================
```