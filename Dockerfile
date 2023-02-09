ARG NODE_VERSION=18.1-alpine
FROM node:${NODE_VERSION}

RUN apk add -u --no-cache \
  bash \
  curl \
  git \
  postgresql-client

ARG HEROKU_VERSION=7.68.0
RUN mkdir -p /usr/local/lib \
  && cd /usr/local/lib \
  && curl https://cli-assets.heroku.com/heroku-v${HEROKU_VERSION}/heroku-v${HEROKU_VERSION}-linux-x64.tar.gz | tar xz \
  && ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku \
  && /usr/local/lib/heroku/bin/node -v || rm /usr/local/lib/heroku/bin/node \
  && heroku version

RUN heroku plugins:install heroku-pg-extras

ENTRYPOINT ["/usr/local/bin/heroku"]
