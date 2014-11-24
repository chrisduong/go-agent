
# Dockerfile for ThoughtWorks Go Agent (http://www.go.cd)

FROM dockerfile/java:oracle-java7
MAINTAINER Chris Duong "chris.duong83@gmail.com"

# Download and install go-agent
ENV VERSION 14.3.0-1186
RUN curl -L -o /tmp/go-agent-${VERSION}.deb http://download.go.cd/gocd-deb/go-agent-${VERSION}.deb; \
	dpkg -i /tmp/go-agent-${VERSION}.deb; \
	rm -f /tmp/go-agent-${VERSION}.deb

# get rid of GO_SERVER AND GO_SERVER_PORT defaults. We'll use env variables.
RUN sed -i '/.*GO_SERVER.*/d' /etc/default/go-agent

# make sure container doesn't exit after starting agent
RUN sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent

# make sure that init.d script passes through environment variables
RUN sed -i 's/su -/su -p/' /etc/init.d/go-agent

# set GO_SERVER env variable to go-server (defined in /etc/hosts)
ENV GO_SERVER go-server

CMD su go -c '/etc/init.d/go-agent start'
