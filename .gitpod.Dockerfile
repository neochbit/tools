FROM ubuntu:20.04

# Prevenir interacción manual al instalar paquetes
ENV DEBIAN_FRONTEND=noninteractive

# Configurar la zona horaria
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    echo "Etc/UTC" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Instalar Docker, Qt, y herramientas necesarias
RUN apt-get install -y \
    docker.io \
    qt5-default \
    g++ \
    make \
    git \
    curl \
    vim && \
    apt-get clean

# Omitir configuración de permisos para Docker
# Gitpod ya maneja usuarios/grupos automáticamente.
# Configurar permisos en contenedores personalizados no es necesario.
# Puedes eliminar las siguientes líneas si no necesitas Docker dentro del contenedor:
# RUN groupadd docker && usermod -aG docker gitpod

# Configurar directorio de trabajo
WORKDIR /workspace
