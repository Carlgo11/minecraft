#!/bin/sh
umask 0077

[ -z "${MC_VERSION}" ] && version=$(curl -s "https://papermc.io/api/v2/projects/paper/" | jq -r '.versions[-1]') || version="${MC_VERSION}"
build=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${version}/" | jq -r '.builds[-1]')
download=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${version}/builds/${build}" | jq -r '.downloads.application.name')
sha=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${version}/builds/${build}" | jq -r '.downloads.application.sha256')

# Check if papermc.jar is present and hashes match
if ([ ! -f "papermc.jar" ] || [ "$(cat sha.txt)" != "${sha}" ]); then
  echo "Downloading PaperMC..."
  curl -o "papermc.jar" "https://papermc.io/api/v2/projects/paper/versions/${version}/builds/${build}/downloads/${download}"

  # Opt out of privacy issues
  mkdir -p plugins/PluginMetrics plugins/bStats
  echo "opt-out: true" > "plugins/PluginMetrics/config.yml"
  echo "enabled: false" > "plugins/bStats/config.yml"

  # Create necessary files
  echo "${sha}" > "sha.txt"
  echo "eula=true" > "eula.txt"
fi
