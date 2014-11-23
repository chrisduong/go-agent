# This file creates a container that contains chef-client and berkshelf
# Use cookbook wrapper technique to deploy
# Author: Chris Duong
# Date: 11/23/2014


FROM chrisduong/chef-solo-berks:0.0.7
MAINTAINER ChrisD

# Prepare CHEF
RUN mkdir -p /chef/cookbooks; \
	echo "cookbook_path \"/chef/cookbooks\" "  > /chef/solo.rb; 
COPY solo.json /chef/