# Go Agent

## Base Image
>dockerfile/java:oracle-java7
## Usage
Run go-server.
>docker run -d --name go-server chrisduong/go-server

Run go-agent
>docker run -d --name go-agent-01 --link go-server:go-server chrisduong/go-agent
