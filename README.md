Basho Riak Dockerfile for CoreOS 
================================
[![Build Status](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop.png?circle-token=992aeaf31e42912f39b24dddfa3e8f54ae1c9fbe)](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop) [![Docker Repository on Quay.io](https://quay.io/repository/joukou/riak/status?token=7d2526bc-fd95-49a4-9caf-91ae6400382c "Docker Repository on Quay.io")](https://quay.io/repository/joukou/riak) [![Apache 2.0](http://img.shields.io/badge/License-apache%202.0-brightgreen.svg)](#license) [![Stories in Ready](https://badge.waffle.io/joukou/joukou-docker-riak.png?label=ready&title=Ready)](http://waffle.io/joukou/joukou-docker-riak) [![IRC](http://img.shields.io/badge/IRC-%23joukou-blue.svg)](irc://irc.freenode.org:6667/#joukou)

[Basho Riak 2.0](http://docs.basho.com/riak/2.0.0/) Dockerfile for
[CoreOS](https://coreos.com/).

## Goal

To create a production ready Basho Riak 2.0 Dockerfile and associated image,
that may be used for commercial purposes.

There are many different ways of doing things within the Docker eco-system. This
project was started by users of [CoreOS](https://coreos.com) and as such will
always prefer solutions based around the associated technology such as
[fleet](https://github.com/coreos/fleet), [etcd](https://github.com/coreos/etcd)
and [rudder](https://coreos.com/blog/introducing-rudder/).

Hector Castro at Basho has an awesome [project to bring up a Riak cluster on Docker](https://github.com/hectcastro/docker-riak).
The main differentiation of this project is the complete focus on
[CoreOS](https://coreos.com). Phusion Baseimage is also not used, the reasons
for that are covered in the
[base Dockerfile project](https://github.com/joukou/joukou-docker-base).

## Status

Unstable. In development. Collaboration and pull requests welcome!

## Usage

Upload the template units to the cluster without starting them:

`fleetctl submit riak\@.service`

Start as many instances as you require:

`fleetctl start riak@1.service riak@2.service riak@3.service`

## Base Image

See [`quay.io/joukou/java`](https://github.com/joukou/joukou-docker-java).

## Volumes

| Location | Purpose |
| -------- | ------- |
| `/etc/riak` | Should contain `riak.conf` and `solr-log4j.properties` |
| `/var/log/riak` | Riak logs |
| `/var/lib/riak` | Riak data. The ephemeral nature of Docker containers aside, it is simply not efficient to store data on the union file system. |

## Exposed Ports

| Port      | Purpose                               |
| --------- | ------------------------------------- |
| 4370      | Erlang Port Mapper Daemon (epmd)      |
| 8087      | Protocol Buffers API                  |
| 8088-8092 | Erlang Distributed Node Protocol      |
| 8093      | Solr                                  |
| 8098      | HTTP API                              |
| 8099      | Intra-Cluster Handoff                 |
| 8985      | Solr JMX                              |

## Contributors

[Isaac Johnston](https://github.com/superstructor) ([Joukou Ltd](https://joukou.com))

## License

Copyright &copy; 2009-2014 Joukou Ltd.

Basho Riak Dockerfile for CoreOS is under the Apache 2.0 license. See the
[LICENSE](LICENSE) file for details.

Some parts have been derived from code developed at Basho Technologies, and can
also be found in the [docker-riak sources](https://github.com/hectcastro/docker-riak).
