#!/bin/bash

# # Instalar el paquete lxc
sudo apt-get update
sudo apt-get install -y lxc
lxd init --auto
# Crear un contenedor de Ubuntu
sudo lxc launch ubuntu:22.04 demo

# Iniciar el contenedor
sudo lxc start demo

# # Instalar PostgreSQL en el contenedor
sudo lxc exec demo -- apt-get update
sudo lxc exec demo -- apt-get install -y postgresql

# # Agregar una línea a pg_hba.conf
sudo lxc exec demo -- sh -c "echo 'host	all         	all         	0.0.0.0/0           	md5' >> /etc/postgresql/14/main/pg_hba.conf"

# # Modificar postgresql.conf
sudo lxc exec demo -- sudo sed -i "s|#archive_command = ''|archive_command = 'test ! -f $HOME/wals/%f && cp %p $HOME/wals/%f'|g" /etc/postgresql/14/main/postgresql.conf
# #Importacion base de datos
sudo lxc exec demo -- sudo -i -u postgres bash -c "psql -c \"ALTER USER postgres WITH PASSWORD 'postgres';\""
sudo lxc exec demo -- sudo -i -u postgres bash -c "psql -c \"create database empresa;\""
sudo lxc file push /home/usuario/WalRecovery/utils/database.sql demo/etc/
sudo lxc exec demo -- sudo -i -u postgres bash -c "psql -d empresa < /etc/database.sql"
sudo lxc file push /home/usuario/WalRecovery/scripts/wals.sh demo/etc/
# Reiniciar PostgreSQL en el contenedor
sudo lxc exec demo -- service postgresql restart

