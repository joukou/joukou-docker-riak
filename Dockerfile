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

# Install Basho Riak
WORKDIR /tmp
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends logrotate && \
    curl -LO http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0/debian/7/riak_2.0.0-1_amd64.deb && \
    dpkg -i riak_2.0.0-1_amd64.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make Riak's data and log directories volumes
VOLUME [ "/var/lib/riak", "/var/log/riak" ]

# Expose ports
#   4370        Erlang Port Mapper Daemon (epmd)
#   8087        Protocol Buffers API
#   8088-8092   Erlang Distributed Node Protocol
#   8093        Solr
#   8098        HTTP API
#   8099        Intra-Cluster Handoff
#   8985        Solr JMX
EXPOSE 4370 8087 8088 8089 8090 8091 8092 8093 8098 8099 8985

# Add boot script
ADD bin/boot /bin/
ENTRYPOINT [ "/bin/boot" ]