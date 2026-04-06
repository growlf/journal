## Common Issues

- **Connection problems**: Check SSH keys, usernames, and network connectivity
- **Permission errors**: Verify `become` settings and sudo configuration
- **Variable errors**: Check variable names, scoping, and precedence
- **Template errors**: Validate Jinja2 syntax and variable references

## Debugging Commands

```bash
# Increase verbosity
ansible-playbook site.yml -v    # verbose
ansible-playbook site.yml -vv   # more verbose
ansible-playbook site.yml -vvv  # very verbose

# Check syntax
ansible-playbook site.yml --syntax-check

# Dry run (don't make changes)
ansible-playbook site.yml --check

# List tasks that would run
ansible-playbook site.yml --list-tasks

# Test connectivity
ansible all -m ping -i inventory/hosts.yml
```

## Useful Debug Tasks

```yaml
# Show variable contents
- name: Debug variable
  debug:
    var: my_variable

# Show multiple variables
- name: Debug multiple items
  debug:
    msg: "Host {{ inventory_hostname }} has IP {{ ansible_default_ipv4.address }}"

# Show all facts
- name: Show all gathered facts
  debug:
    var: ansible_facts
```