# Minecraft Docker Container

[![GitHub](https://img.shields.io/github/license/carlgo11/minecraft?style=for-the-badge)](LICENSE)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Carlgo11/Minecraft/Docker%20Build%20Test?style=for-the-badge)](https://github.com/Carlgo11/minecraft/actions)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/carlgo11/minecraft?style=for-the-badge)](https://hub.docker.com/r/carlgo11/minecraft)

This is a containerized way to run a Minecraft server securly and always up to date.  
The Minecraft container runs PaperMC, a Spigot fork with performance improvements.

## Usage

### Docker

To start a server with console access, run:

```sh
docker run --read-only -p 25565:25565 -v ./minecraft:/minecraft carlgo11/minecraft
```

To start a server without access to the console, run:

```sh
docker run -p 25565:25565 -v ./minecraft:/minecraft -d carlgo11/minecraft
```

The flag `--read-only ` can also be added for extra security.

### Docker-Compose

Template compose file:

```YAML
version: '3.3'
services:
  minecraft:
    image: carlgo11/minecraft
    restart: unless-stopped
    ports:
      - '25565:25565'
    volumes:
      - './minecraft:/minecraft'
    read_only: true
    tty: true
    stdin_open: true

```

To run the server short term with console access, do:

```sh
docker-compose run minecraft
```

To run the server normally, do:

```sh
docker-compose up -d
```

## Environment Variables

|name|description|
|----|-----------|
|MC_VERSION|Desired Minecraft version (+v1.8.8 supported)|
