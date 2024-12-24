#!/usr/bin/env bash

SERVICES=$(COMPOSE_PROFILES=dev COMPOSE_PROJECT_NAME=igamt_dev docker compose config --services)

for SERVICE in $SERVICES; do
    STATUS=$(COMPOSE_PROFILES=dev COMPOSE_PROJECT_NAME=igamt_dev docker compose ps --filter "status=running" --services | grep -w "$SERVICE")
    if [ -n "$STATUS" ]; then
        echo "$SERVICE up"
    else
        echo "$SERVICE down"
    fi
done
