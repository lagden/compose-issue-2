# entr
FROM lagden/entr:4.6-alpine3.12 as entr

LABEL autodelete="true"
LABEL maintainer="docker@lagden.in"

# APP DEV
FROM node:14.15-alpine3.12

LABEL maintainer="docker@lagden.in"

# RUN apk update && apk upgrade && apk add --no-cache bash

## If Docker Host is Mac or Windows
ARG ENTR_INOTIFY_WORKAROUND=1
ENV ENTR_INOTIFY_WORKAROUND=$ENTR_INOTIFY_WORKAROUND

ARG NODE_ENV="production"
ARG BASE="/home/node"

ENV NODE_ENV=$NODE_ENV
ENV BASE=$BASE
ENV BASE_APP=$BASE/app

# # User
# ARG USER_ID=1000
# ARG GROUP_ID=1000

# RUN deluser --remove-home node
# RUN addgroup -S node -g $GROUP_ID
# RUN adduser -S -G node -u $USER_ID node

WORKDIR /usr/local/bin
COPY --from=entr /usr/local/bin/entr .

WORKDIR $BASE

ADD --chown=node:node . $BASE_APP

WORKDIR $BASE_APP

RUN npm ci --ignore-scripts

USER node
