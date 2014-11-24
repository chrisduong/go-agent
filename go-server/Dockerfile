
# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)

FROM dockerfile/java:oracle-java7
MAINTAINER Chris Duong "chris.duong83@gmail.com"

# Download and install go-server
ENV VERSION 14.3.0-1186
RUN curl -L -o /tmp/go-server-${VERSION}.deb http://download.go.cd/gocd-deb/go-server-${VERSION}.deb; \
	dpkg -i /tmp/go-server-${VERSION}.deb; \
	rm -f /tmp/go-server-${VERSION}.deb

CMD /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log

EXPOSE 8153
EXPOSE 8154
