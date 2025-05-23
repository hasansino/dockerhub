#!/bin/bash

set -e

GC_FLAGS=${GC_FLAGS:-'all=-N -l'}
echo GC_FLAGS=$GC_FLAGS

# start delve debug server
if [ "$1" = 'debug' ]; then
    if [ ! -f main.go ]; then
        echo >&2 'No main.go file found to build.'
        exit 1
    fi
    echo >&2 "Starting project with delve debugger."
    echo >&2 "Running with args: ${@:2}"
    exec dlv debug --accept-multiclient --listen=:40000 --headless=true --api-version=2 -- ${@:2}
fi

# build app using cache and then execute
if [ "$1" = 'build' ]; then
    if [ ! -f main.go ]; then
        echo >&2 'No main.go file found to build.'
        exit 1
    fi
    echo >&2 "Building go project using cache."
    go build -gcflags="$GC_FLAGS" -o /app main.go
    echo >&2 "Running with args: ${@:2}"
    cd / && exec /app ${@:2}
fi

# if arbitrary command was passed, execute it instead of default one
exec "$@"
