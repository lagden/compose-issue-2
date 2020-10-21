# APP DEV
FROM node:14.14-alpine3.12

ARG NODE_ENV="production"
ARG BASE="/home/node"

ENV NODE_ENV=$NODE_ENV
ENV BASE=$BASE
ENV BASE_APP=$BASE/app

# User
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN deluser --remove-home node
RUN addgroup -S node -g $GROUP_ID
RUN adduser -S -G node -u $USER_ID node

WORKDIR $BASE

ADD --chown=node:node . $BASE_APP

WORKDIR $BASE_APP

RUN npm ci --ignore-scripts

USER node
