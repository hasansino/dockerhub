# Sentry stack in single container

This is old version of sentry services (9.1.2) packed in single container.  

## Prerequisites

* Postgres (SENTRY_POSTGRES_HOST)
* Redis (SENTRY_REDIS_HOST)

## Running with docker compose
```bash
sentry:
  image: hasansino/sentry
  environment:
    - SENTRY_POSTGRES_HOST=postgres.service.consul
    - SENTRY_REDIS_HOST=redis.service.consul
  volumes:
    - ./etc/sentry:/etc/sentry           # configuration
    - sentry-data:/var/lib/sentry/files  # persistent storage
```

## Extract default configuration

```bash
docker cp {CONTAINER_ID}:/etc/sentry /tmp/sentry
```

## Web UI

Container exposes port `80` for web interface.  
Default auth is `admin:admin`.  
