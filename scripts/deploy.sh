#!/bin/bash

set -ex

yarn global add now@canary now-replace
APP_URL=$(now -t $NOW_TOKEN --public -e PRIVATE_KEY=@private-key -e APP_ID=@app-id -e WEBHOOK_SECRET=@webhook-secret -e NODE_ENV="production")
now scale $APP_URL 1 -t $NOW_TOKEN
now-replace graphene-probot $APP_URL -t $NOW_TOKEN