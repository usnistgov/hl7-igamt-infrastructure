#!/usr/bin/env bash

PROFILE=$1

if [ -z "$PROFILE" ]; then
  echo "Usage: $0 <profile> (e.g., dev, test, prod)"
  exit 1
fi

SERVICES=$(COMPOSE_PROFILES=$PROFILE docker compose config --services)

for SERVICE in $SERVICES; do
    STATUS=$(COMPOSE_PROFILES=$PROFILE docker compose ps --filter "status=running" --services | grep -w "$SERVICE")
    if [ -n "$STATUS" ]; then
        echo "$SERVICE up"
    else
        echo "$SERVICE down"
    fi
done
