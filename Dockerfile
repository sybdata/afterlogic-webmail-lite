FROM alpine:3.8

LABEL description="Fast, easy-to-use and open-source webmail front-end for your existing IMAP mail server" \
      maintainer="Hardware <contact@meshup.net>"

ARG VERSION=8
ARG SHA256_HASH="6539825c5977f73732a66fd4063f114dbc686f4357092dcc9145fcd129741aa6"

ENV UID=991 GID=991 UPLOAD_MAX_SIZE=25M LOG_TO_STDOUT=false MEMORY_LIMIT=128M

RUN echo "@community https://nl.alpinelinux.org/alpine/v3.8/community" >> /etc/apk/repositories \
 && apk -U upgrade \
 && apk add -t build-dependencies \
    openssl \
    wget \
    ca-certificates \
 && apk add \
    musl \
    nginx \
    s6 \
    su-exec \
    php7-fpm@community \
    php7-pdo_mysql@community \
    php7-json@community \
    php7-iconv@community \
    php7-mbstring@community \
    php7-xml@community \
    php7-dom@community \
    php7-openssl@community \
    php7-curl@community \
 && cd /tmp \
 && wget -q https://afterlogic.org/download/webmail-lite-php-${VERSION}.zip \
 && CHECKSUM=$(sha256sum webmail-lite-php-${VERSION}.zip | awk '{print $1}') \
 && if [ "${CHECKSUM}" != "${SHA256_HASH}" ]; then echo "ERROR: Checksum does not match!" && exit 1; fi \
 && mkdir /afterlogic-webmail-lite && unzip -q /tmp/webmail-lite-php-${VERSION}.zip -d /afterlogic-webmail-lite \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /
RUN chmod +x /usr/local/bin/run.sh /services/*/run /services/.s6-svscan/*
VOLUME /afterlogic-webmail-lite/data
EXPOSE 8888
CMD ["run.sh"]
