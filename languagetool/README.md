# LanguageTool self-hosted server

+ Config is located at /etc/lt/server.properties in the container.
+ Default port is 8080.
+ Starts with "--allow-origin *" and "--public". (no auth required)
+ fasttext included.

```yaml
  languagetool:
    image: ghcr.io/hasansino/languagetool:latest
    ports:
      - 8080:8080
```
