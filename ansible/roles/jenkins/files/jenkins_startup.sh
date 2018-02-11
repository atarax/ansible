#!/bin/bash

docker run \
	--name jenkins \
	--rm \
	-d \
	-u root \
	-p 8080:8080 \
	-p 50000:50000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v jenkins_data:/var/jenkins_home atarax/jenkins
