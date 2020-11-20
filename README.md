# Minecraft Docker Container

[![GitHub](https://img.shields.io/github/license/carlgo11/minecraft?style=for-the-badge)](LICENSE)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Carlgo11/Minecraft/Docker%20Build%20Test?style=for-the-badge)](https://github.com/Carlgo11/minecraft/actions)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/carlgo11/minecraft?style=for-the-badge)](https://hub.docker.com/r/carlgo11/minecraft)

This is a containerized way to run a Minecraft server securly and always up to date.  
The minecraft container runs PaperMC, a Spigot fork with performance improvements.

## Installation

1. Download this repository
1. Run `docker-compose run -p 25565:25565 minecraft`
1. Use the server console as normal. When you're done, exit the program and run `docker-compose start` instead. This runs the server in the background and without console access.
