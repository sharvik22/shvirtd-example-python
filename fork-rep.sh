#!/bin/bash

# Установка Docker и Docker Compose, если они не установлены
if ! command -v docker &> /dev/null; then
    sudo apt update
    sudo apt install -y docker.io
fi

if ! command -v docker-compose &> /dev/null; then
    sudo apt install -y docker-compose
fi

# Проверка и клонирование/обновление репозитория
if [ ! -d "/opt/shvirtd-example-python" ]; then
    sudo git clone https://github.com/sharvik22/shvirtd-example-python.git /opt/shvirtd-example-python
else
    cd /opt/shvirtd-example-python
    sudo git pull
fi

# Запуск проекта с помощью Docker Compose
cd /opt/shvirtd-example-python
sudo docker-compose -f compose.yaml up -d
