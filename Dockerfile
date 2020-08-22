FROM neverendingqs/node-lts-git-hub-image:latest

WORKDIR /action

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]