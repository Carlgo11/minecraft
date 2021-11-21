#!/bin/sh
umask 0077
url="https://papermc.io/api/v2/projects/paper"
[ -z "${MC_VERSION}" ] && url="${url}/versions/$(curl -s "$url" | jq -r '.versions[-1]')" || url="${url}/versions/${MC_VERSION}"
url="${url}/builds/$(curl -s "${url}" | jq -r '.builds[-1]')"
build=$(curl -s "${url}" | base64)
sha=$(echo "${build}" | base64 -d | jq -r '.downloads.application.sha256')

# Check if papermc.jar is present & hashes match
if ([ ! -f "papermc.jar" ] || [ "$(cat sha.txt)" != "${sha}" ]); then
  echo "Downloading PaperMC..."
  curl -o "papermc.jar" "${url}/downloads/$(echo "${build}" | base64 -d | jq -r '.downloads.application.name')"

  # Opt out of privacy issues
  mkdir -p plugins/PluginMetrics plugins/bStats
  echo "opt-out: true" >"plugins/PluginMetrics/config.yml"
  echo "enabled: false" >"plugins/bStats/config.yml"

  # Create necessary files
  echo "${sha}" >"sha.txt"
  echo "eula=true" >"eula.txt"
fi
