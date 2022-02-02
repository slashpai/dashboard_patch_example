# dashboard_patch_example
dashboard update using jsonnet patch example


```bash
jb install
```

## Generate original dashboard files

```jsonnet
jsonnet -J vendor original.jsonnet|tee original.json
```

## Patching

```jsonnet
 jsonnet -J vendor main.jsonnet|tee main.json
```
