#!/bin/sh
umask 0077
echo "eula=true" > eula.txt;
if [ ! -f papermc.jar ]; then
echo "Downloading PaperMC..."
curl -o papermc.jar "https://papermc.io/api/v1/paper/$(curl -s "https://papermc.io/api/v1/paper" | jq -r '.versions[0]')/latest/download"
fi
java -jar papermc.jar "$@"