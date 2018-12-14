#### Quick Reference
1. [esp-open-sdk]: Free and open (as much as possible) integrated SDK for ESP8266/ESP8285 chips
2. [dtec/esp8266]: ESP8266 SDK Build Toolchain Docker Image 

[esp-open-sdk]: https://github.com/pfalcon/esp-open-sdk.git
[dtec/esp8266]: https://hub.docker.com/r/dtec/esp8266

#### Using Toolchain
From project source path
```
$ sudo docker run --name esp8266 -it --rm -v $PWD:/src/project esp8266:1.22-p
$ make all
```
