
# Dockerfile for ThoughtWorks Go Server (http://www.go.cd)

FROM dockerfile/java
MAINTAINER ChrisD 

ENV DOWNLOAD_URL http://download.go.cd/gocd-deb/go-server-14.3.0-1186.deb

RUN wget -O /tmp/go-server.deb $DOWNLOAD_URL
RUN dpkg -i /tmp/go-server.deb
RUN rm -f /tmp/go-server.deb

CMD /etc/init.d/go-server start && tail -F /var/log/go-server/go-server.log

EXPOSE 8153
EXPOSE 8154
