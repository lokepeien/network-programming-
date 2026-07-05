FROM alpine:3.19

RUN apk add --no-cache \
    procps \
    util-linux \
    coreutils \
    bash

COPY sysinfo.sh /usr/local/bin/sysinfo.sh
RUN chmod +x /usr/local/bin/sysinfo.sh

ENTRYPOINT ["/usr/local/bin/sysinfo.sh"]
