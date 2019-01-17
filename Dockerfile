FROM alpine:3.8

RUN apk update && \
    apk add git asciidoc imagemagick

RUN apk add bash

RUN mkdir -p /build && \
    cd /build && \
    if [ "$HTTP_PROXY" != "" ]; then \
      git config --global http.proxy $HTTP_PROXY ; \
    fi && \
    git clone https://github.com/sonatype/nexus-book.git

WORKDIR /build/nexus-book

RUN dos2unix *.sh && \
    chmod +x *.sh && \
    ls && \
    cp build.sh build.orig #&& \
RUN    awk '/pdf version/ {skip=2;next} skip > 0 {skip--;next} {print}' build.orig > build.sh #&& \
RUN    ./build.sh
