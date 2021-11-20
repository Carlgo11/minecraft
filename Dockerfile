FROM openjdk:17-alpine
RUN apk --force-refresh --no-cache --purge -f -u add curl jq
RUN adduser minecraft -u 1000 -D -H
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN mkdir /minecraft; chown 1000 /minecraft -R
USER minecraft
WORKDIR /minecraft
RUN ls -la
ENTRYPOINT /entrypoint.sh
EXPOSE 25565
