#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install make language-pack-ru -y
sudo apt-get install postgresql-9.5 postgresql-server-dev-9.5 -y
sudo apt-get install postgresql-client-9.5 libghc-postgresql-simple-dev -y

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

# установка ruby последней версии
sudo apt-get install ruby ruby-dev -y
sudo apt-get install nodejs -y

cd DancingSchool
sudo gem install rails
sudo gem install pg
sudo gem install bundler
sudo gem install sqlite3

sudo bundle install

sudo /etc/init.d/postgresql start

# настройка баз данных девелоперской и тестовой
bash /vagrant/postgres_init.sh

# bash /vagrant/nginx_init.sh

sudo chown -R vagrant:vagrant /home/vagrant/

exit 0