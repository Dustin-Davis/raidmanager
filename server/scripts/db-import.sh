#!/bin/sh

set -e

# shellcheck source=/dev/null
test -f .env && . .env

psql "$DATABASE_URL" -f sql/schema.sql -f sql/data.sql
