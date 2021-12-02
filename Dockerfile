FROM alpine
RUN apk --no-cache --purge --update add curl jq && \
    apk --no-cache --purge --update --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community add openjdk17-jre-headless && \
    adduser -DHu 1000 minecraft
COPY --chown=1000 entrypoint.sh /entrypoint.sh
RUN mkdir /minecraft && \
    chown 1000:1000 /minecraft -R
USER 1000
WORKDIR /minecraft
ENTRYPOINT /entrypoint.sh;java -jar papermc.jar "$@"
