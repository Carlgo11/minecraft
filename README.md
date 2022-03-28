# Minecraft Docker Container
[![GPL-3.0](https://img.shields.io/github/license/carlgo11/minecraft?style=for-the-badge)][license]
[![GitHub Packages](https://img.shields.io/github/v/release/carlgo11/minecraft?logo=github&style=for-the-badge)][github_packages]
[![Docker Hub](https://img.shields.io/github/v/release/carlgo11/minecraft?logo=docker&logoColor=fff&style=for-the-badge)][docker_hub]

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

The flag `--read-only` can also be added for extra security.

### Docker-Compose

Template compose file:

```YAML
version: '3.3'
services:
  minecraft:
    image: carlgo11/minecraft
    restart: unless-stopped
    read_only: true
    stdin_open: true
    tty: true
    ports:
      - '25565:25565'
    volumes:
      - './minecraft:/minecraft'
    tmpfs:
      - '/tmp/:exec'

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

[license]: LICENSE
[github_packages]: https://github.com/Carlgo11/guest-portal/pkgs/container/guest-portal
[docker_hub]: https://hub.docker.com/r/carlgo11/minecraft/tags
