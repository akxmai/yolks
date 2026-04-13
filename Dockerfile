FROM --platform=$TARGETOS/$TARGETARCH ghcr.io/graalvm/jdk-community:21-ol9

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL org.opencontainers.image.licenses="MIT"

RUN microdnf install -y \
        curl \
        lsof \
        ca-certificates \
        openssl \
        git \
        tar \
        sqlite \
        fontconfig \
        tzdata \
        iproute \
        freetype \
        redis \
        zip \
        unzip \
        jq \
    && microdnf clean all

RUN useradd -m -d /home/container -s /bin/bash container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY --chown=container:container entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
