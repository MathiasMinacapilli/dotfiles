#!/usr/bin/env -S bash -euET -o pipefail -O inherit_errexit

# FROM: https://gist.github.com/cseelye/7fd9fe4ad36308cdc79b515f8e26fb06

set -x

if which sudo; then
    SUDO=sudo
else
    SUDO=
fi

${SUDO} rm -f /etc/apt/sources.list.d/docker.list
${SUDO} apt-get update
${SUDO} apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    lsb-release \
    qemu-user-static

${SUDO} install -m 0755 -d /etc/apt/keyrings
${SUDO} curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
${SUDO} chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | ${SUDO} tee /etc/apt/sources.list.d/docker.list > /dev/null
${SUDO} apt-get update
${SUDO} apt-get install --yes --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    docker-buildx-plugin
${SUDO} usermod -aG docker $(id -un)
