# run as root!!

# updates repos
apt update

# upgrades system packages if needed
apt upgrade -y

# installs the latest version of docker and docker compose

# docker install script
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
# docker compose v2
apt install docker-compose-v2

# starts the nextcloud aio install process
sudo docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 80:80 \
--publish 8080:8080 \
--publish 8443:8443 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
ghcr.io/nextcloud-releases/all-in-one:latest