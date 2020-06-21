FROM node:lts-slim
WORKDIR /action

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y curl git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]