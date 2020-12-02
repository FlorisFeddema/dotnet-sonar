FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL maintainer="Floris Feddema <floris1996@hotmail.com>"
LABEL app_name="dotnet-sonar"

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/FlorisFeddema/dotnet-sonar" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV DOTNETCORE_SDK=3.1 \
    OPENJDK_VERSION=11

RUN apt-get update 

RUN apt-get dist-upgrade -y 
RUN apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

RUN apt-get install -y openjdk-$OPENJDK_VERSION-jre

RUN dotnet tool install -g dotnet-sonarscanner
