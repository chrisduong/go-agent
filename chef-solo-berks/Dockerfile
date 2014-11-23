# This file creates a container that contains chef-client and berkshelf
# 
# Author: Chris Duong
# Date: 11/03/2014


FROM chef/ubuntu-14.04
MAINTAINER ChrisD

# Install chef and its prerequisites
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
      git \
      build-essential \
      libxml2-dev \
      libxslt-dev && \
    apt-get install -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc && \
 	/opt/chef/embedded/bin/gem install berkshelf &&  rm -rf /tmp/* /var/tmp/*