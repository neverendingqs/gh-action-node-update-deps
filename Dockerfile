FROM node:lts-slim
WORKDIR /action

RUN curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.1

RUN apt update && \
  apt upgrade -y && \
  apt install -y git

ENTRYPOINT ["/entrypoint.sh"]