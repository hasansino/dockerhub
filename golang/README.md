# Golang with delve debugger

Accepts either `build` or `debug` command, that will compile
main.go in working directory and run it.  

If `debug` was issued, application will be executed in debug mode
using delve package on port 40000.

## Running from terminal
```bash
docker run --rm -it \
-v "${GOPATH}/src/github.com/hasansino/apptemplate:/go/src/github.com/hasansino/apptemplate" \
-w /go/src/github.com/hasansino/apptemplate \
hasansino/golang:latest build
```

## Running with docker-compose
```go
example:
  image: hasansino/golang:latest
  command: build
  working_dir: /go/src/github.com/hasansino/apptemplate
  volumes:
    - go-cache:/root/.cache/go-build
    - ${GOPATH}/src/github.com/hasansino/apptemplate:/go/src/github.com/hasansino/apptemplate
```

## Access running container
```bash
docker exec -it {CONTAINER_ID} bash
```
