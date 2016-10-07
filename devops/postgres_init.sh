#!/usr/bin/env bash

PG_USER="dschool"
PG_PASSWD="12345"
PG_DATABASE="dschool_development"
# PG_DATABASE="dschool_test"

PGHBA_FILEPATH=$(sudo -u postgres bash -c "psql -t -P format=unaligned -c 'show hba_file'")
PGCONF_FILEPATH=$(sudo -u postgres bash -c "psql -t -P format=unaligned -c 'show config_file'")

# sudo grep $PG_DATABASE $PGHBA_FILEPATH

# ====================================================================
# создать пользователя и БД, если их ещё нет
# сменить пароль, если пользователь уже существует
# ====================================================================
if [[ `sudo -u postgres bash -c "psql postgres -tAc \"SELECT 1 FROM pg_roles WHERE rolname='$PG_USER'\""` ]]
then
    sudo -u postgres bash -c "psql -c \"ALTER USER $PG_USER WITH PASSWORD '$PG_PASSWD';\""
else
    sudo -u postgres bash -c "psql -c \"CREATE USER $PG_USER WITH PASSWORD '$PG_PASSWD';\""
fi

if [[ ! `sudo -u postgres bash -c "psql -tAc \"SELECT 1 FROM pg_database WHERE datname='$PG_DATABASE'\""` ]]; then
    sudo -u postgres bash -c "psql -c \"CREATE DATABASE $PG_DATABASE WITH OWNER $PG_USER;\""
    sudo -u postgres bash -c "psql $PG_DATABASE < /home/vagrant/wspace/sql/schema.sql"
fi

sudo -u postgres bash -c "psql -c \"ALTER USER $PG_USER CREATEDB;\""

# ====================================================================
# Редактировать pg_hba.conf
#   - удалить все упоминания используемой базы данных
#   - перейти к парольному подключению к БД PG_DATABASE для
#       локального и мастер-хоста виртуальной машины
# ====================================================================

sudo sed -i "/$PG_DATABASE/d" $PGHBA_FILEPATH

sudo sed -i "s/^local\s\+all\s\+all\s\+peer/#local    all    all    peer/" $PGHBA_FILEPATH

echo "local  $PG_DATABASE  $PG_USER                  password" | sudo tee --append $PGHBA_FILEPATH > /dev/null
echo "host   $PG_DATABASE  $PG_USER  192.168.0.5/0   password" | sudo tee --append $PGHBA_FILEPATH > /dev/null


# ====================================================================
# Редактировать postgresql.conf
#  - Слушать все интерфейсы
# ====================================================================

sudo sed -i -e "s/^#listen_addresses/listen_addresses/" $PGCONF_FILEPATH
sudo sed -i -e "s/^listen_addresses.*/listen_addresses = '*'/" $PGCONF_FILEPATH


# ====================================================================
# Перезагрузить postgres
# ====================================================================

sudo service postgresql restart

exit 0