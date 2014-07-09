# Copyright 2014 Joukou Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM quay.io/joukou/java
MAINTAINER Isaac Johnston <isaac.johnston@joukou.com>

ENV DEBIAN_FRONTEND noninteractive

# Adds supervisord config
ADD etc/supervisord.d/riak.conf /etc/supervisord.d/

# Install Basho Riak
WORKDIR /tmp
RUN curl -LO http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0/debian/7/riak_2.0.0-1_amd64.deb && \
    dpkg -i riak_2.0.0-1_amd64.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make Riak's data and log directories volumes
VOLUME [ "/var/lib/riak", "/var/log/riak" ]

# Expose ports
#   4370        intra-cluster   Erlang Port Mapper Daemon (epmd)
#   8087        intra-cluster   Protocol Buffers API
#   8088-8092   intra-cluster   Erlang Distributed Node Protocol
#   8093        intra-cluster   Solr
#   8098        intra-cluster   HTTP API
#   8099        intra-cluster   Intra-Cluster Handoff
#   8985        intra-cluster   Solr JMX
EXPOSE 4370 8087 8088 8089 8090 8091 8092 8093 8098 8099 8985
