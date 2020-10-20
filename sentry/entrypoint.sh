#!/bin/bash

# This script starts all sentry services inside single container.
# Kind of against docker way - but it keeps docker-compose file tidy.

# `sentry upgrade` can take a long time to finish upon first launch.

set -e

# if `sentry` command is passed we start sentry stack
if [ "$1" = 'sentry' ]; then
    # initialize database, do nothing if it was done before
    echo -e "\e[32mUpgrading sentry database..."
    nohup sentry upgrade --no-repair --noinput > /var/log/sentry/upgrade.log 2>&1

    # create default user
    # it will fail if user already exist, but will not interrupt this script
    echo -e "\e[32mCreating default user..."
    nohup sentry createuser --email admin --password admin --superuser >> /dev/null 2>&1 || true

    # run cron process
    echo -e "\e[32mStarting sentry-cron..."
    nohup sentry run cron -l ERROR --autoreload > /var/log/sentry/cron.log 2>&1 &

    # run worker process
    echo -e "\e[32mStarting sentry-worker... "
    nohup sentry run worker -l ERROR --autoreload -c 1 > /var/log/sentry/worker.log 2>&1 &

    # start web UI
    echo -e "\e[32mStarting sentry-web.."
    exec sentry run web -l ERROR -w 1 --noinput
fi

# if arbitrary command was passed, execute it instead of default one
exec "$@"
