Basho Riak Dockerfile for Joukou
================================
[![Build Status](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop.png?circle-token=992aeaf31e42912f39b24dddfa3e8f54ae1c9fbe)](https://circleci.com/gh/joukou/joukou-docker-riak/tree/develop) [![Docker Repository on Quay.io](https://quay.io/repository/joukou/riak/status?token=7d2526bc-fd95-49a4-9caf-91ae6400382c "Docker Repository on Quay.io")](https://quay.io/repository/joukou/riak) [![Apache 2.0](http://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](#license) [![Stories in Ready](https://badge.waffle.io/joukou/joukou-docker-riak.png?label=ready&title=Ready)](http://waffle.io/joukou/joukou-docker-riak) [![IRC](http://img.shields.io/badge/IRC-%23joukou-blue.svg)](http://webchat.freenode.net/?channels=joukou)

[Basho Riak 2.0](http://docs.basho.com/riak/2.0.0/) Dockerfile for
[Joukou](https://joukou.com).

Hector Castro at Basho has a [project to bring up a Riak cluster on Docker](https://github.com/hectcastro/docker-riak).
The main differentiation of this project is the complete focus on
[CoreOS](https://coreos.com).

## Usage

Executed via [Joukou Fleet Units](https://github.com/joukou/joukou-fleet).

## Base Image

See [`quay.io/joukou/java`](https://github.com/joukou/joukou-docker-java).

## Environment Variables

| Name | Default |
| --- | --- |
| RIAK_LOG_CONSOLE | `console` |
| RIAK_LOG_CONSOLE_LEVEL | `info` |
| RIAK_LOG_CRASH | `on` |
| RIAK_LOG_CRASH_MAXIMUM_MESSAGE_SIZE | `64KB` |
| RIAK_LOG_CRASH_SIZE | `10MB` |
| RIAK_LOG_CRASH_ROTATION | `$D0` |
| RIAK_LOG_CRASH_ROTATION_KEEP | `5` |
| RIAK_NODENAME | riak@127.0.0.1 |
| RIAK_DISTRIBUTED_COOKIE | riak |
| RIAK_ERLANG_ASYNC_THREADS | 64 |
| RIAK_ERLANG_MAX_PORTS | 65536 |
| RIAK_ERLANG_SCHEDULERS_FORCE_WAKEUP_INTERVAL | 500 |
| RIAK_ERLANG_SCHEDULERS_COMPACTION_OF_LOAD | false |
| RIAK_ERLANG_SCHEDULERS_UTILIZATION_BALANCING | true |
| RIAK_RING_SIZE | 64 |
| RIAK_TRANSFER_LIMIT | 2 |
| RIAK_STRONG_CONSISTENCY | on |
| RIAK_PROTOBUF_BACKLOG | 128 |
| RIAK_ANTI_ENTROPY | active |
| RIAK_STORAGE_BACKEND | leveldb |
| RIAK_OBJECT_FORMAT | 1 |
| RIAK_OBJECT_SIZE_WARNING_THRESHOLD | 5MB |
| RIAK_OBJECT_SIZE_MAXIMUM | 50MB |
| RIAK_OBJECT_SIBLINGS_WARNING_THRESHOLD | 25 |
| RIAK_OBJECT_SIBLINGS_MAXIMUM | 100 |
| RIAK_CONTROL | on |
| RIAK_CONTROL_AUTH_MODE | off |
| RIAK_CONTROL_AUTH_USER_ADMIN_PASSWORD | pass |
| RIAK_LEVELDB_MAXIMUM_MEMORY_PERCENT | 70 |
| RIAK_SEARCH | on |
| RIAK_SOLR_START_TIMEOUT | 30s |
| RIAK_SOLR_JVM_OPTIONS | -d64 -Xms1g -Xmx1g -XX:+UseStringCache - UseCompressedOops |
| RIAK_ERLANG_DISTRIBUTION_PORT_RANGE_MINIMUM | 8088 |
| RIAK_ERLANG_DISTRIBUTION_PORT_RANGE_MAXIMUM | 8092 |
| RIAK_JAVASCRIPT_MAXIMUM_STACK_SIZE | 32MB |
| RIAK_JAVASCRIPT_MAXIMUM_HEAP_SIZE | 16MB |
| RIAK_JAVASCRIPT_HOOK_POOL_SIZE | 4 |
| RIAK_JAVASCRIPT_REDUCE_POOL_SIZE | 6 |
| RIAK_JAVASCRIPT_MAP_POOL_SIZE | 8 |

## Volumes

| Location | Purpose |
| -------- | ------- |
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

## Metrics

[![Throughput Graph](https://graphs.waffle.io/joukou/joukou-docker-riak/throughput.svg)](https://waffle.io/joukou/joukou-docker-riak/metrics)

## Contributors

* [Isaac Johnston](https://github.com/superstructor) ([Joukou Ltd](https://joukou.com))
* [Vincent Ambo](https://github.com/tazjin) ([Kivra AB](https://www.kivra.com/))

## License

Copyright &copy; 2014 Joukou Ltd.

Basho Riak Dockerfile for Joukou is under the Apache 2.0 license. See the
[LICENSE](LICENSE) file for details.

Some parts have been derived from code developed at Basho Technologies, and can
also be found in the [docker-riak sources](https://github.com/hectcastro/docker-riak).
