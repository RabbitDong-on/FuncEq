FROM ubuntu:14.04

WORKDIR /FuncEq

COPY . .

RUN \
	# Install the dependencies
	apt-get update && \
	apt-get install -y vim tmux git net-tools inetutils-ping