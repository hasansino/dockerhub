# Golang with delve debugger

Accepts either `build` or `debug` command, that will compile
main.go in working directory and run it.  

If `debug` was issued, application will be executed in debug mode
using delve package on port 40000.

## Running from terminal
```bash
docker run --rm -it \
-v "${GOPATH}/src/github.com/{user}/{project}:/go/src/github.com/{user}/{project}" \
-w /go/src/github.com/{user}/{project} \
ghcr.io/hasansino/golang:{tag} build
```

## Running with docker-compose
```go
example:
  image: ghcr.io/hasansino/golang:{tag}
  command: build
  working_dir: /go/src/github.com/{user}/{project}
  volumes:
    - go-cache:/root/.cache/go-build
    - ${GOPATH}/src/github.com/{user}/{project}:/go/src/github.com/{user}/{project}

volumes:
  go-cache:
```

## Access running container
```bash
docker exec -it {CONTAINER_ID} bash
```
