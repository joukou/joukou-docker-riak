Basho Riak Dockerfile for CoreOS 
================================
[![Build Status](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop.png?circle-token=992aeaf31e42912f39b24dddfa3e8f54ae1c9fbe)](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop) [![Docker Repository on Quay.io](https://quay.io/repository/joukou/riak/status?token=7d2526bc-fd95-49a4-9caf-91ae6400382c "Docker Repository on Quay.io")](https://quay.io/repository/joukou/riak) [![Apache 2.0](http://img.shields.io/badge/License-apache%202.0-brightgreen.svg)](#license) [![Stories in Ready](https://badge.waffle.io/joukou/joukou-docker-riak.png?label=ready&title=Ready)](http://waffle.io/joukou/joukou-docker-riak)

[Basho Riak 2.0](http://docs.basho.com/riak/2.0.0/) Dockerfile.

## Goal

To create a general purpose production ready Basho Riak 2.0 Dockerfile and associated image, that may be used for commercial purposes.

There are many different ways of doing things within the Docker eco-system. This project was started by users of [CoreOS](https://coreos.com) and as such will always prefer solutions based around the associated technology such as [fleet](https://github.com/coreos/fleet), [etcd](https://github.com/coreos/etcd) and [rudder](https://coreos.com/blog/introducing-rudder/).

Hector Castro at Basho has an awesome [project to bring up a Riak cluster on Docker](https://github.com/hectcastro/docker-riak). The main differentiation of this project is the complete focus on [CoreOS](https://coreos.com). Phusion Baseimage is also not used, the reasons for that are covered in the [base Dockerfile project](https://github.com/joukou/joukou-docker-base).

## Status

In development. Collaboration and pull requests welcome!

## Pull Image

`docker pull quay.io/joukou/riak`

## Base Image

[`quay.io/joukou/java`](https://github.com/joukou/joukou-docker-java).

## Usage

### With Fleet

See [joukou/joukou-fleet-riak](https://github.com/joukou-fleet-riak) for associated Fleet units.

### Without Fleet

```
docker run --name riak-config \
-v /etc/riak:/etc/riak \
quay.io/joukou/riak-config

docker run --name riak \
-v /etc/riak:/etc/riak \
-v /var/lib/riak:/var/lib/riak \
-v /var/log/riak:/var/log/riak \
quay.io/joukou/riak
```

## Exposed Ports

| Port      | Network       | Purpose                               |
| --------- | ------------- | ------------------------------------- |
| 4370      | intra-cluster | Erlang Port Mapper Daemon (epmd)      |
| 8087      | intra-cluster | Protocol Buffers API                  |
| 8088-8092 | intra-cluster | Erlang Distributed Node Protocol      |
| 8093      | intra-cluster | Solr                                  |
| 8098      | intra-cluster | HTTP API                              |
| 8099      | intra-cluster | Intra-Cluster Handoff                 |
| 8985      | intra-cluster | Solr JMX                              |

`intra-cluster` means that, in my opinion, none of these ports should be directly exposed to the public internet.

If, for example, you want to expose the riak control web interface setup a reverse proxy container for that purpose.

## Contributors

[Isaac Johnston](https://github.com/superstructor) ([Joukou Ltd](https://joukou.com))

## License

Copyright &copy; 2014 Joukou Ltd.

Basho Riak Dockerfile for CoreOS is under the Apache 2.0 license. See the
[LICENSE](LICENSE) file for details.
