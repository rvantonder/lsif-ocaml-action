FROM comby/base-dependencies-alpine-3.10:latest

WORKDIR /build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
