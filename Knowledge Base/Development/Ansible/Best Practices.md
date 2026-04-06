## Directory Organization

- **Keep related files together**: Group variables, templates, and tasks logically
- **Use descriptive names**: Clear naming for hosts, groups, and variables
- **Separate environments**: Use different inventory files for dev/staging/production
- **Version control**: Always store your Ansible code in version control

## Variable Management

- **Use group_vars and host_vars**: Avoid hardcoding values in playbooks
- **Encrypt sensitive data**: Always use Ansible Vault for passwords and keys
- **Follow naming conventions**: Use consistent prefixes (e.g., `app_name`, `app_port`)
- **Document variables**: Comment complex variables and their purposes

## Task Design

- **Write idempotent tasks**: Ensure tasks can run multiple times safely
- **Use descriptive task names**: Make it clear what each task accomplishes
- **Handle errors appropriately**: Use `ignore_errors`, `failed_when`, etc. when needed
- **Tag your tasks**: Use tags for selective execution and better organization

## Performance Optimization

- **Disable fact gathering when not needed**: Use `gather_facts: no` for simple tasks
- **Use pipelining**: Enable SSH pipelining in `ansible.cfg` for better performance
- **Limit parallel connections**: Adjust `forks` in configuration for your environment
- **Cache facts**: Use fact caching for environments with many hosts
