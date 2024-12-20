FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

# Instalar Docker y herramientas necesarias
RUN apt-get update && apt-get install -y \
    docker.io \
    qt5-default \
    g++ \
    make \
    git \
    curl \
    vim \
    && apt-get clean

# Configurar permisos para Docker
RUN groupadd docker && usermod -aG docker gitpod

# Configurar directorio de trabajo
WORKDIR /workspace
