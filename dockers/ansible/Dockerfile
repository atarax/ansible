FROM ubuntu:16.04

RUN   apt-get update && \
        apt-get install software-properties-common --yes && \
        apt-add-repository ppa:ansible/ansible && \
        apt-get update && \
        apt-get install ansible --yes