
# Dockerfile for ThoughtWorks Go Agent (http://www.go.cd)

FROM dockerfile/java:oracle-java7
MAINTAINER Chris Duong "chris.duong83@gmail.com"

# Download and install go-agent
ENV VERSION 14.3.0-1186
RUN curl -L -o /tmp/go-agent-${VERSION}.deb http://download.go.cd/gocd-deb/go-agent-${VERSION}.deb; \
	dpkg -i /tmp/go-agent-${VERSION}.deb; \
	rm -f /tmp/go-agent-${VERSION}.deb

#set GO_SERVER address (defined in /etc/hosts)
RUN sed -i 's/^\(GO_SERVER=\s*\).*$/\1go-server/' /etc/default/go-agent; \
	sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent; \
	# make sure that init.d script passes through environment variables
	sed -i 's/su -/su -p/' /etc/init.d/go-agent

ENTRYPOINT ["/etc/init.d/go-agent", "start"]
