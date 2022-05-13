ARG NODE_VERSION=18.1-alpine
FROM node:${NODE_VERSION}

RUN apk add -u --no-cache \
  git \
  postgresql-client

ARG HEROKU_CLI_VERSION=7.60.2
RUN npm install -g heroku@${HEROKU_CLI_VERSION}

LABEL version=${HEROKU_CLI_VERSION}
LABEL description='Heroku CLI packaged on alpine linux'

ENTRYPOINT ["/usr/local/bin/heroku"]
