# Should stick with 2022.6.x before https://github.com/home-assistant/core/issues/75142 is fixed
# Otherwise it would fail on Raspberry Pi 1st Gen
FROM ghcr.io/home-assistant/home-assistant:2022.6.7

LABEL org.opencontainers.image.authors="Richard" \
	org.opencontainers.image.title="Homeassistant-gpio" \
	org.opencontainers.image.description="Home assistant container image with GPIO lib installed" \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.url="https://hub.docker.com/r/richardzone/homeassistant-gpio/" \
	org.opencontainers.image.source="https://github.com/richardzone/homeassistant-dht" \
  docker.build="docker build --pull -t richardzone/homeassistant-gpio:latest" \
	docker.run="docker run --rm --name homeassistant_gpio --device=/dev/gpiomem -v ./config:/config -v /etc/localtime:/etc/localtime:ro --restart=unless-stopped --privileged --net=host -d richardzone/homeassistant-gpio:latest"

apk add --no-cache libgpiod
