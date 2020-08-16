FROM neverendingqs/gh-action-node-update-deps-image:latest

WORKDIR /action

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]