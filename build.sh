docker buildx create --name multi-arch-builder --use
docker buildx inspect --bootstrap
docker buildx build . --platform linux/arm/v7 -t ulrichfrank/vls2mqtt:latest --push

