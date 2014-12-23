
# Dockerfile for ThoughtWorks Go Agent (http://www.go.cd)

# Pull base image.
FROM ubuntu:12.04
MAINTAINER Chris Duong "chris.duong83@gmail.com"


# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common python-software-properties && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Install Java.
RUN \
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java7-installer && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Download and install go-agent
ENV VERSION 14.3.0-1186
ENV GO_SERVER go-server
RUN curl -L -o /tmp/go-agent-${VERSION}.deb http://download.go.cd/gocd-deb/go-agent-${VERSION}.deb; \
    dpkg -i /tmp/go-agent-${VERSION}.deb; \
    rm -f /tmp/go-agent-${VERSION}.deb

#set GO_SERVER address (defined in /etc/hosts)
RUN sed -i 's/^\(GO_SERVER=\s*\).*$/\1\$GO_SERVER/' /etc/default/go-agent; \
	sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent; \
	# make sure that init.d script passes through environment variables
	sed -i 's/su -/su -p/' /etc/init.d/go-agent

ENTRYPOINT ["/etc/init.d/go-agent", "start"]
