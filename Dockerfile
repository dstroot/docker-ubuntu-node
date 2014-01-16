# DOCKER-VERSION 0.7.6
FROM	ubuntu:latest

# Install Node
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN	apt-get update
RUN	apt-get install -y python-software-properties python g++ make
RUN	add-apt-repository ppa:chris-lea/node.js
RUN	apt-get update
RUN	apt-get install -y nodejs

# Add Source
ADD . /src

# Install dependecies
RUN cd /src; npm install

# Open port
EXPOSE 8080

# Run App
CMD ["node", "/src/index.js"]
