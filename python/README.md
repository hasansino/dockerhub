# Python development image

## Features

* UV package manager
* Rust toolchain (for pydantic)

## Example

```yaml
services:
  app:
    image: ghcr.io/hasansino/python:latest
    command: run main.py
    working_dir: /app
    volumes:
      - ./:/app
    ports:
      - "8080:8080"
```