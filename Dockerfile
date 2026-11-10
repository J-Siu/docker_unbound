FROM alpine:edge
ARG PKG="unbound"
ARG VER="1.26.2-r0"
ARG USR="https://github.com/J-Siu"
LABEL version=${VER}
LABEL maintainers="[John Sing Dao Siu](${USR})"
LABEL name=${PKG}
LABEL usage="${USR}/docker_${PKG}/blob/master/README.md"
LABEL description="Docker - Unbound DNS over TLS (DoT) Forwarder"

RUN apk --no-cache add \
${PKG}=${VER} \
ca-certificates \
ca-certificates-bundle \
tzdata \
openssl
COPY unbound.conf /etc/unbound/

EXPOSE 53
CMD ["unbound","-d"]
