# Minecraft Docker Container

This is a containerized way to run a Minecraft server securly and always up to date.  
The minecraft container runs PaperMC, a Spigot fork with performance improvements.


## Installation

1. Download this repository
1. Run `docker-compose run -p 25565:25565 minecraft`
1. Use the server console as normal. When you're done, exit the program and run `docker-compose start` instead. This runs the server in the background and without console access.
