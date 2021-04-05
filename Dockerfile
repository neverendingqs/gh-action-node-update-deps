FROM neverendingqs/node-lts-git-gh-image:latest

WORKDIR /action

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]