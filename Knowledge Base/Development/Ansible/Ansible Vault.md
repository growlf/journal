## What it is

Ansible Vault is a feature that allows you to **encrypt sensitive data** like passwords, API keys, certificates, and other secrets. Instead of storing sensitive information in plain text, Vault encrypts the data and requires a password or key file to decrypt it during playbook execution. This ensures that sensitive information remains secure in version control systems and shared environments.

## Basic Usage

Create an encrypted file:

```bash
ansible-vault create vault/secrets.yml
```

Encrypt an existing file:

```bash
ansible-vault encrypt group_vars/production.yml
```

Edit an encrypted file:

```bash
ansible-vault edit vault/secrets.yml
```

Run playbook with vault:

```bash
ansible-playbook site.yml --ask-vault-pass
# Or with password file
ansible-playbook site.yml --vault-password-file .vault_pass
```

## Example

`vault/secrets.yml` (encrypted):

```yaml
# This file would be encrypted by ansible-vault
database_password: "super_secret_password123"
api_key: "sk-1234567890abcdef"
ssl_certificate_key: |
  -----BEGIN PRIVATE KEY-----
  MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC...
  -----END PRIVATE KEY-----
```

Reference vault variables in playbooks:

```yaml
- name: Configure database connection
  template:
    src: database.conf.j2
    dest: /etc/myapp/database.conf
  vars:
    db_password: "{{ database_password }}"  # From vault file
```
