---
completed: true
rating: great
value: 2
distance: 10
c: 0
---
See [[https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/guides/examples/|Docs]] for more...
`INPUT[toggle:completed]`
```meta-bind
INPUT[slider(
addLabels, 
minValue(0), 
maxValue(10)
):value]
```
```meta-bind
INPUT[inlineSelect(
option(bad),
option(meh),
option(ok),
option(good),
option(great)
):rating]
```
Distance: `INPUT[number:memory^distance]` km
Distance in freedom units: `VIEW[round(number({memory^distance} km, miles), 2)][math:c]` miles

Theme Switcher: `BUTTON[light-mode, dark-mode]`
```meta-bind-button
style: destructive
label: Light Mode
id: light-mode
hidden: true
actions:
  - type: command
    command: theme:use-light
```

```meta-bind-button
label: Insert with relative line numbers
style: default
action:
  type: insertIntoNote
  line: selfEnd + 1
  value: Hello
```

```meta-bind-button
style: primary
label: Dark Mode
id: dark-mode
hidden: true
actions:
  - type: command
    command: theme:use-dark
```
