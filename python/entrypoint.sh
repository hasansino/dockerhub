#!/bin/bash

set -e

pip install --no-cache-dir -r requirements.txt

if [ "$1" = 'run' ]; then
  python $2
fi

# if arbitrary command was passed, execute it instead of default one
exec "$@"
