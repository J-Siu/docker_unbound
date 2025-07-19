# Docker - Unbound DNS over TLS (DoT) Forwarder [![Paypal donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/donate/?business=HZF49NM9D35SJ&no_recurring=0&currency_code=CAD)

Base: alpine:latest with unbound from apk

Small image < 14M.

Default config use Google and Cloudflare as DoT forwarder

### Table Of Content
<!-- TOC -->

- [Build](#build)
- [Usage](#usage)
  - [Standard Usage](#standard-usage)
  - [Custom Config](#custom-config)
- [/etc/unbound/unbound.conf](#etcunboundunboundconf)
- [Repository](#repository)
- [Contributors](#contributors)
- [Change Log](#change-log)
- [License](#license)

<!-- /TOC -->

### Build

```sh
git clone https://github.com/J-Siu/docker_unbound.git
cd docker_unbound
docker build --network=host -t jsiu/unbound .
```

### Usage

#### Standard Usage

```txt
docker run -d \
  -p 53:53/udp \
  -p 53:53/tcp \
  jsiu/unbound:latest
```

#### Custom Config

Unbound custom config file:

```txt
docker run -d \
  -v <absolute path config file>:/etc/unbound/unbound.conf
  -p 53:53/udp \
  -p 53:53/tcp \
  jsiu/unbound:latest
```

Unbound custom config directory:

```txt
docker run -d \
  -v <absolute path config dir>:/etc/unbound/ \
  -p 53:53/udp \
  -p 53:53/tcp \
  jsiu/unbound:latest
```

### /etc/unbound/unbound.conf

```ini
server:
  username: unbound
  interface: ::0
  interface: 0.0.0.0
  #interface-automatic: yes
  verbosity: 0
  prefer-ip6: yes
  do-ip4: yes
  do-ip6: yes
  do-udp: yes
  do-tcp: yes
  tls-cert-bundle: /etc/ssl/cert.pem
  # Logs
  logfile: ""
  use-syslog: no
  log-replies: no
  log-tag-queryreply: no
  log-servfail: no
  hide-identity: yes
  hide-version: yes
  hide-trustanchor: yes
  # Allow recursive query from anywhere
  access-control: 0.0.0.0/0 allow
  access-control: ::0/0 allow
  # Force cache min. ttl
  #cache-min-ttl: 300
forward-zone:
  name: "."
  forward-tls-upstream: yes
  # Google
  #forward-addr: 2001:4860:4860::8888@853
  #forward-addr: 2001:4860:4860::8844@853
  forward-addr: 8.8.8.8@853
  forward-addr: 8.8.4.4@853
  # Cloudflare DNS
  #forward-addr: 2606:4700:4700::1111@853
  #forward-addr: 2606:4700:4700::1001@853
  forward-addr: 1.1.1.1@853
  forward-addr: 1.0.0.1@853
```

### Repository

- [docker_unbound](https://github.com/J-Siu/docker_unbound)

### Contributors

- [John Sing Dao Siu](https://github.com/J-Siu)

### Change Log

- 1.10.1-r0
  - unbound 1.10.1-r0
- 1.10.1-r1
  - Auto update to 1.10.1-r1
- 1.11.0-r0
  - Auto update to 1.11.0-r0
- 1.12.0-r0
  - Auto update to 1.12.0-r0
- 1.13.0-r3
  - Auto update to 1.13.0-r3
- 1.13.1-r0
  - Auto update to 1.13.1-r0
- 1.13.1-r1
  - Auto update to 1.13.1-r1
- 1.13.1-r2
  - Auto update to 1.13.1-r2
- 1.15.0-r0
  - Auto update to 1.15.0-r0
- 1.15.0-r0-p1
  - Add docker push github workflow
- 1.16.1-r0
  - Auto update to 1.16.1-r0
- 1.17.1-r0
  - Auto update to 1.17.1-r0
- 1.17.1-r2
  - Auto update to 1.17.1-r2
- 1.17.1-r3
  - Auto update to 1.17.1-r3
- 1.23.1-r0
  - Auto update to 1.23.1-r0
<!--CHANGE-LOG-END-->

### License

The MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
