<<<<<<< HEAD
go-agent
========

Build go-agent container
=======
# ChrisDuong's Dockerfile

This repository contains Dockerfile  for Docker's automated build published to the public Docker Hub Registry.

# Go-server and Go-agent Dockerfile
## Base Image
>dockerfile/java:oracle-java7
## Usage
Run go-server.
>docker run -d --name go-server chrisduong/go-server

Run go-agent
>docker run -d --name go-agent-01 --link go-server:go-server chrisduong/go-agent
>>>>>>> 4cdf2fb7c12e12c360621cf39792b7a4e43bf36f
