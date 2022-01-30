FROM maven:3.8.4-openjdk-17 AS build

RUN apt-get update -y
RUN apt-get install -y maven

run mvn package