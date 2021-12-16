FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN set -ex \
  && apt-get update \
  && apt install -y \
      net-tools \
      iputils-ping \
      vim \
      ffmpeg

COPY ffserver.conf /etc/
      
EXPOSE 9950
EXPOSE 9951

WORKDIR /app
COPY entrypoint.sh ./
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT /app/entrypoint.sh

