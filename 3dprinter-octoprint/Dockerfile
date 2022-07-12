ARG BUILD_FROM="ghcr.io/home-assistant/amd64-base-debian:bullseye"
FROM ${BUILD_FROM}
ARG OCTOPRINT_VERSION="1.8.1"

ENV OCTOPRINT_VERSION=${OCTOPRINT_VERSION}

# Setup path for persistent install of Python packages
ENV PYTHONPATH=/data/python/octoprint
ENV PYTHONUSERBASE=/data/python/octoprint
ENV PATH=/data/python/octoprint/bin:${PATH}

# Install dependencies
RUN apt update && \
    apt install -y \
        --no-install-recommends \
        python3-venv \
        python3-dev \
        python3-wheel \
        build-essential \
        nginx \
        # Extras.
        # ffmpeg \
        # avrdude \
        # dfu-util \
        # dfu-programmer \
        # stm32flash \
    && \
    apt clean

# Copy root filesystem
COPY rootfs /
RUN chmod +x /etc/cont-init.d/*.sh
RUN chmod +x /etc/services.d/*/*
RUN chmod +x /scripts/*.sh
