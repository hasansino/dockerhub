#!/bin/bash

set -e

if [ ! -d ".venv" ]; then
  uv venv
fi

if [ "$1" = 'run' ]; then
  . .venv/bin/activate
  uv pip install --no-cache-dir -r requirements.txt
  python "$2"
fi

exec "$@"