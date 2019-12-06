ARG NODE_VERSION=13.2.0-alpine
FROM node:${NODE_VERSION}

RUN apk add -u --no-cache \
  git \
  postgresql-client

ARG HEROKU_CLI_VERSION=7.35.0
RUN yarn global add heroku@${HEROKU_CLI_VERSION}

LABEL version=${HEROKU_CLI_VERSION}
LABEL description='Heroku CLI packaged on alpine linux'

ENTRYPOINT ["/usr/local/bin/heroku"]
