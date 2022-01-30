FROM maven:3.8.4-openjdk-17 AS build

COPY src /home/app/src
COPY pom.xml /home/app

RUN apt-get update -y
