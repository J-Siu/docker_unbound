FROM alpine:edge

LABEL version="1.23.1-r1"
LABEL maintainers="[John Sing Dao Siu](https://github.com/J-Siu)"
LABEL name="unbound"
LABEL usage="https://github.com/J-Siu/docker_unbound/blob/master/README.md"
LABEL description="Docker - Unbound DNS over TLS (DoT) Forwarder"

RUN apk --no-cache add ca-certificates ca-certificates-bundle tzdata
RUN apk --no-cache add unbound=1.23.1-r1
COPY unbound.conf /etc/unbound/
EXPOSE 53
CMD ["unbound","-d"]