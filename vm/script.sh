#!/bin/bash

# Log referente a execução do script
exec > /var/log/custom-script-output.log 2>&1
set -x

# Preparar ambiente atualizando pacotes e o sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Docker
sudo apt-get install docker.io -y
sudo systemctl enable --now docker

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar diretório para arquivos Docker
DOCKER_DIR="/home/wordpress/docker_wordpress"
sudo mkdir -p $DOCKER_DIR
cd $DOCKER_DIR

# Criar arquivos de senhas
echo "GAud4mZby8F3SD6P" | sudo tee ./mysql_root_password.txt
echo "GAud4mZby8F3SD6P" | sudo tee ./wordpress_db_password.txt

# Criar arquivo docker-compose.yml
sudo tee docker-compose.yml > /dev/null <<EOF
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD_FILE: /run/secrets/wordpress_db_password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wordpress:/var/www/html
    secrets:
      - wordpress_db_password

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/mysql_root_password
      MYSQL_DATABASE: wordpress
    volumes:
      - db_data:/var/lib/mysql
    secrets:
      - mysql_root_password

volumes:
  wordpress:
  db_data:

secrets:
  mysql_root_password:
    file: ./mysql_root_password.txt
  wordpress_db_password:
    file: ./wordpress_db_password.txt
EOF

# Subir containers com Docker Compose
sudo docker-compose up -d

# Delay para garantir que o serviço foi inciado
sleep 10

# Verificar o status dos containers
sudo docker-compose ps

# Indicar que o script foi finalizado com sucesso e
echo "Script de inicialização concluído com sucesso." | sudo tee -a /var/log/custom-script-output.log
