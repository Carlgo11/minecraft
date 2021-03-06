FROM bellsoft/liberica-openjdk-alpine-musl:11
RUN apk --force-refresh --no-cache --purge -f -u add curl jq
RUN adduser minecraft -u 1000 -D -H
COPY entrypoint.sh /entrypoint.sh
USER minecraft
WORKDIR /minecraft
CMD /entrypoint.sh
EXPOSE 25565