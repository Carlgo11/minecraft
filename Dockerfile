FROM alpine
RUN apk add --no-cache openjdk8-jre curl jq
RUN adduser minecraft -u 1000 -D -H
COPY entrypoint.sh /entrypoint.sh
WORKDIR /minecraft
CMD /entrypoint.sh
EXPOSE 25565