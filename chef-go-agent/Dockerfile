# Chef-solo to build container with go-server from ThoughtWorks
# Author: Chris Duong
# Date: 11/23/2014


FROM chrisduong/chef-oracle-java
MAINTAINER Chris Duong "chris.duong83@gmail.com"

# Install go-server
ENV VERSION 14.3.0-1186
ENV DOWNLOAD_URL http://download.go.cd/gocd-deb/go-server-14.3.0-1186.deb

RUN curl -L -o /tmp/go-server-${VERSION}.deb http://download.go.cd/gocd-deb/go-server-${VERSION}.deb; \
	dpkg -i /tmp/go-server-${VERSION}.deb; \
	rm -f /tmp/go-server-${VERSION}.deb

CMD /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log

EXPOSE 8153
EXPOSE 8154