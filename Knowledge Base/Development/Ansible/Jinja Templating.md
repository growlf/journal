## What is Jinja2?

Jinja2 is a powerful templating engine for Python that generates dynamic text-based files. Originally designed for web applications, it's widely used in Ansible, Flask, and many other frameworks to create configuration files, HTML pages, and any text format where content needs to change based on variables or logic.

## Core Syntax Elements

### Delimiters

Jinja2 uses three types of delimiters to distinguish template code from plain text:

- **`{{ variable }}`** - Expressions that output values to the rendered template
- **`{% statement %}`** - Control structures like loops, conditionals, and blocks
- **`{# comment #}`** - Comments that won't appear in the final output

### Variables

Variables are passed from your application to the template via a context dictionary. You access them using double curly braces:

```jinja2
{{ username }}
{{ user.email }}
{{ config['database'] }}
```

The first line outputs the value of `username` directly. The second uses dot notation to access the `email` attribute of the `user` object—Jinja2 first looks for an attribute called `email`, and if not found, tries dictionary key lookup. The third explicitly uses dictionary bracket notation to get the `database` value from the `config` dictionary. If any variable doesn't exist, Jinja2 returns an undefined object which typically renders as an empty string rather than raising an error.

### Filters

Filters modify variables using the pipe `|` symbol. They're essentially functions that transform data:

```jinja2
{{ name | upper }}              # Converts to uppercase
{{ price | round(2) }}          # Rounds to 2 decimal places
{{ items | length }}            # Returns list/string length
{{ servers | join(', ') }}      # Joins list items with comma-space
{{ port | default(8080) }}      # Uses 8080 if port is undefined
```

Each filter transforms the value on its left. The `upper` filter converts text like "john" to "JOHN". The `round(2)` filter takes a number like 3.14159 and rounds it to 3.14 (two decimal places). The `length` filter counts items in a list or characters in a string. The `join` filter takes a list like `['web1', 'web2']` and produces "web1, web2". The `default` filter provides a fallback value when the variable is undefined or empty—if `port` is not set, it uses 8080 instead.

Multiple filters can be chained: `{{ text | striptags | title }}` first removes HTML tags from the text, then title-cases the result (capitalizing the first letter of each word).

## Control Structures

### Conditionals

The `if` statement works like Python, testing whether variables are defined, non-empty, or meet specific conditions:

```jinja2
{% if user.is_admin %}
    <a href="/admin">Admin Panel</a>
{% elif user.is_authenticated %}
    <a href="/dashboard">Dashboard</a>
{% else %}
    <a href="/login">Login</a>
{% endif %}
```

This conditional renders different navigation links based on user status. It first checks if `user.is_admin` is true—if so, it shows the Admin Panel link and stops. If not, it checks `user.is_authenticated`—if true, it shows the Dashboard link. If neither condition is met, it defaults to showing the Login link. Only one branch executes, providing role-based navigation.

Conditionals support all standard comparison operators (`==`, `!=`, `>`, `<`, etc.) and logical operators (`and`, `or`, `not`).

### For Loops

Loops iterate over sequences (lists, tuples, dicts) with powerful built-in features:

```jinja2
{% for server in backend_servers %}
    server {{ server.name }} {{ server.ip }}:{{ server.port }}
{% endfor %}
```

This loop takes a list of server objects and generates one configuration line per server. If `backend_servers` contains three servers, this produces three lines like "server web1 192.168.1.10:8080". The loop variable `server` temporarily holds each item during its iteration, allowing you to access its properties.

**Loop Variable**: Inside loops, a special `loop` variable provides metadata:

```jinja2
{% for item in items %}
    <li class="{% if loop.first %}first{% endif %} 
               {% if loop.last %}last{% endif %}">
        Item {{ loop.index }}: {{ item }}
    </li>
{% endfor %}
```

This generates an HTML list where special CSS classes are added to the first and last items. The `loop.first` is true only on the first iteration, adding class "first". The `loop.last` is true only on the final iteration. The `loop.index` provides the current iteration number starting at 1, so you get "Item 1", "Item 2", etc. This is useful for styling alternating rows, numbering items, or applying special formatting to boundary elements.

Key `loop` properties:
- `loop.index` - Current iteration (1-indexed)
- `loop.index0` - Current iteration (0-indexed)
- `loop.first` / `loop.last` - Boolean for first/last item
- `loop.length` - Total number of items
- `loop.cycle('odd', 'even')` - Cycles through values for alternating styles

**Loop Filtering**: You can filter items directly in the loop declaration:

```jinja2
{% for user in users if not user.hidden %}
    <li>{{ user.username }}</li>
{% endfor %}
```

Instead of looping through all users and checking each one with a separate `if` statement, this filters the list at the loop level. Only users where `user.hidden` is false get processed. The advantage is that `loop.index` correctly counts only the visible users—if you have 10 users but 3 are hidden, `loop.length` will be 7, not 10. This keeps your numbering and pagination accurate.

**Else Clause**: Loops support an `else` block that executes if the sequence was empty:

```jinja2
{% for user in users %}
    <li>{{ user.username }}</li>
{% else %}
    <li>No users found</li>
{% endfor %}
```

If the `users` list is empty or all items were filtered out, the `else` block runs instead. This prevents generating empty `<ul>` tags and provides user-friendly feedback. Without this, an empty list would produce no output at all, potentially breaking your layout or leaving users confused.

### Template Inheritance

One of Jinja2's most powerful features is template inheritance, allowing you to create a base layout that child templates extend.

**Base Template** (`base.html`):
```jinja2
<!DOCTYPE html>
<html>
<head>
    <title>{% block title %}{% endblock %} - My Site</title>
</head>
<body>
    <nav>{% block navigation %}{% endblock %}</nav>
    <main>{% block content %}{% endblock %}</main>
    <footer>{% block footer %}&copy; 2024{% endblock %}</footer>
</body>
</html>
```

This base template defines the overall page structure with four named blocks: `title`, `navigation`, `content`, and `footer`. The blocks act as placeholders that child templates can fill. Notice the footer block has default content ("&copy; 2024")—if a child doesn't override it, this appears. Empty blocks like `title` render as blank unless filled. This establishes your site's skeleton once, ensuring consistent layout across all pages.

**Child Template**:
```jinja2
{% extends "base.html" %}

{% block title %}Home{% endblock %}

{% block content %}
    <h1>Welcome!</h1>
    <p>This is the homepage content.</p>
{% endblock %}
```

The `extends` tag tells Jinja2 to use `base.html` as the foundation—this must be the first line. The child then defines specific blocks: setting the title to "Home" and providing homepage content. The navigation block isn't defined here, so it remains empty (from the base). The footer block isn't defined either, so it uses the base's default copyright. The final rendered page combines the base's structure with the child's specific content, producing a complete HTML page with the title "Home - My Site".

**Super Blocks**: Call the parent's block content with `super()`:

```jinja2
{% block footer %}
    {{ super() }}
    <p>Additional footer content</p>
{% endblock %}
```

Instead of replacing the parent's footer entirely, `super()` inserts the parent block's content first, then adds new content after. If the base footer contains copyright info, this preserves it and appends extra information. This is crucial when you want to extend rather than replace—like adding page-specific footer links while keeping the standard copyright notice. Without `super()`, you'd have to duplicate the parent's content in every child template.

## Advanced Features

### Macros

Macros are reusable template functions that accept parameters:

```jinja2
{% macro input(name, type='text', value='') %}
    <input type="{{ type }}" 
           name="{{ name }}" 
           value="{{ value | e }}">
{% endmacro %}
```

This macro named `input` generates HTML input fields with three parameters: `name` (required), `type` (defaults to 'text'), and `value` (defaults to empty string). The `| e` filter escapes the value to prevent XSS attacks. By defining this once, you avoid repeating the same HTML structure throughout your templates.

Call the macro like a function:

```jinja2
{{ input('username') }}
{{ input('password', type='password') }}
{{ input('email', value=user.email) }}
```

The first call generates `<input type="text" name="username" value="">` using all defaults. The second overrides the type to create a password field. The third provides a pre-filled value from the user object. This demonstrates how macros work like functions—you can pass positional or keyword arguments, and defaults apply when arguments are omitted. If you need to change the input structure later, you update one macro instead of dozens of duplicated tags.

### Assignments

The `set` tag creates or modifies variables:

```jinja2
{% set navigation = [('/', 'Home'), ('/about', 'About')] %}
{% set active_page = 'home' %}
```

The first line creates a `navigation` variable containing a list of tuples—each tuple has a URL and label. The second creates a simple string variable. These variables are then available throughout the template. This is useful for defining configuration at the template top or storing computed values for reuse. You can later loop through `navigation` to build menus or check `active_page` to highlight the current section.

**Important**: Variables set inside loops or blocks don't persist outside them due to scoping. For cross-scope changes, use `namespace` objects:

```jinja2
{% set ns = namespace(found=false) %}
{% for item in items %}
    {% if item.matches %}
        {% set ns.found = true %}
    {% endif %}
{% endfor %}
Found: {{ ns.found }}
```

This solves the scoping problem. A regular `{% set found = true %}` inside the loop would disappear after the loop ends. By creating a `namespace` object first, then setting attributes on it (`ns.found`), the changes persist because you're modifying an object's attribute rather than reassigning a variable. After the loop completes, `ns.found` reflects whether any matching item was discovered. This pattern is essential for carrying state out of loops—like tracking whether validation failed or counting special items.

### Whitespace Control

By default, Jinja2 preserves whitespace. Control it with minus signs:

```jinja2
{% for item in items -%}
    {{ item }}
{%- endfor %}
```

Without the minus signs, this loop would output each item followed by a newline and indentation from the template's formatting, resulting in something like "item1\n    item2\n    item3". The `-%}` at the end of the opening tag removes whitespace after it (the newline and spaces before `{{ item }}`). The `{%-` at the start of the closing tag removes whitespace before it (the newline after `{{ item }}`). Together, they produce `item1item2item3` with no spaces or newlines—useful for generating compact configuration files or when whitespace would break functionality (like CSV files).

### Include and Import

**Include** renders another template inline:

```jinja2
{% include 'header.html' %}
<main>Page content</main>
{% include 'footer.html' %}
```

The `include` tag literally inserts the contents of another template at that position, as if you copy-pasted it. The included template has access to all variables from the including template. This is perfect for reusing components like headers and footers—change `header.html` once and all pages automatically update. The rendering happens as one combined template, so includes can reference variables you've set earlier.

**Import** loads macros from another template:

```jinja2
{% from 'forms.html' import input, textarea %}
{{ input('username') }}
{{ textarea('comments', rows=5) }}
```

Unlike `include`, `import` brings in specific macros by name without rendering the whole template. If `forms.html` contains 10 macros but you only need `input` and `textarea`, this selectively imports just those two. They become available as callable functions in your template. This is similar to Python's `from module import function` syntax—you're pulling in reusable code without cluttering your namespace with everything from the source file.

## Practical Example

Here's a complete Nginx configuration template demonstrating multiple features:

```jinja2
# Server configuration for {{ server_name | default('localhost') }}
# Generated: {{ timestamp }}

user {{ nginx_user | default('www-data') }};
worker_processes {{ ansible_processor_vcpus | default(2) }};

{% for server in servers %}
server {
    listen {{ server.port | default(80) }};
    server_name {{ server.name }};
    
    {% if server.ssl_enabled %}
    ssl_certificate {{ server.ssl_cert }};
    ssl_certificate_key {{ server.ssl_key }};
    {% endif %}
    
    {% for location in server.locations %}
    location {{ location.path }} {
        proxy_pass {{ location.backend }};
        {% if location.cache_enabled %}
        proxy_cache {{ location.cache_name }};
        {% endif %}
    }
    {% endfor %}
}
{% endfor %}
```

This template generates a complete Nginx configuration file. The first comment uses `default('localhost')` to provide a fallback server name. The `nginx_user` defaults to 'www-data' (standard on Debian/Ubuntu), and `worker_processes` uses the CPU count from Ansible facts or defaults to 2. 

The outer loop iterates through multiple server configurations. Each server block gets its port (defaulting to 80 for HTTP) and server name. The conditional checks if SSL is enabled—if true, it adds certificate directives; if false, it skips them entirely, keeping the config clean.

The inner loop generates location blocks for each route configuration. Every location gets its path and backend proxy destination. The nested conditional adds caching only when enabled for that specific location. This demonstrates real-world template complexity: you're using filters for safety, conditionals for optional features, nested loops for hierarchical data, and generating valid config syntax from structured data. A single template can produce configurations for dozens of servers with hundreds of locations, all from one maintainable template file.

## Using Templates in Ansible Playbooks

Here's a simple example showing how to use a Jinja2 template in an Ansible playbook.

**Template File** (`templates/motd.j2`):

jinja2

```jinja2
Welcome to {{ server_name }}!

This server is managed by {{ admin_name }}.
Environment: {{ environment }}

{% if backup_enabled %}
Backups are enabled and run daily.
{% endif %}
```

**Ansible Playbook** (`playbook.yml`):


```yaml
---
- name: Configure message of the day
  hosts: webservers
  become: yes
  
  vars:
    server_name: "Production Web Server"
    admin_name: "IT Team"
    environment: "production"
    backup_enabled: true

  tasks:
    - name: Deploy MOTD from template
      ansible.builtin.template:
        src: templates/motd.j2
        dest: /etc/motd
        owner: root
        group: root
        mode: '0644'
```

**What Happens:**

When you run this playbook with `ansible-playbook playbook.yml`, Ansible:

1. Reads the template file `motd.j2`
2. Replaces `{{ server_name }}` with "Production Web Server"
3. Replaces `{{ admin_name }}` with "IT Team"
4. Replaces `{{ environment }}` with "production"
5. Includes the backup message because `backup_enabled: true`
6. Writes the final result to `/etc/motd` on the target server

**The Generated File** (`/etc/motd`):

```
Welcome to Production Web Server!

This server is managed by IT Team.
Environment: production

Backups are enabled and run daily.
```

That's it! The template module automatically renders the Jinja2 template with your variables and copies the result to the destination.
## Best Practices

1. **Use filters for defaults**: `{{ port | default(80) }}` is cleaner than conditionals
2. **Escape user input**: Use `| e` filter to prevent XSS attacks in HTML contexts
3. **Keep logic simple**: Complex logic belongs in your application, not templates
4. **Name blocks descriptively**: `{% block navigation %}` is better than `{% block nav %}`
5. **Use macros for repetition**: DRY principle applies to templates as well