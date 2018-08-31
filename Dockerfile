FROM ubuntu:16.04

LABEL company="dtec" \
      maintainer="Denis Muratov xeronm@gmail.com" \
      example="docker run --name esp8266 -it --rm dtec/esp8266:1.22" \
      description="Toolchain for xtensa-lx106 based on crosstool-NG 1.22.x" \
      com.name="dtec/esp8266:1.22" \
      com.version="1.22" \
      com.release-date="2018-06-02"
 
WORKDIR /src

RUN apt-get update && \
    apt-get install -y make unrar-free autoconf automake libtool gcc g++ gperf \
      flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
      sed git unzip bash help2man wget bzip2 libtool-bin && \
    git clone --recursive https://github.com/pfalcon/esp-open-sdk.git && \
    adduser esp8266 && \
    chown -R esp8266:esp8266 /src/esp-open-sdk && \ 
    cd esp-open-sdk && \
    git reset --hard 5518fb6116c35a02ccb9a87260bb194a57cb429e && \
    su esp8266 -c 'make STANDALONE=n' && \
    rm -rf crosstool-NG/.build && \
    rm -rf crosstool-NG/local-patches/gcc/4.8.5/1000-*

ENTRYPOINT [ "/bin/bash" ]
