FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends wget && \
  wget -P /tmp https://downloads.linux.hpe.com/SDR/repo/mcp/Debian/pool/non-free/hp-ams_2.8.3-3056.1ubuntu16_amd64.deb && \
  apt-get install -y /tmp/hp-ams_2.8.3-3056.1ubuntu16_amd64.deb && \
  rm /tmp/hp-ams_2.8.3-3056.1ubuntu16_amd64.deb && \
  apt-get remove -y wget && apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

CMD ["/sbin/amsHelper", "-f"]