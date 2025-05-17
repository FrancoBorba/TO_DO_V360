#!/bin/bash
set -o errexit

# Carrega o ambiente Ruby
source /opt/render/.bashrc

# Instala dependências
bundle install --path vendor/bundle

# Configura o banco (podemos resetar completamente)
bundle exec rails db:drop db:create db:migrate db:seed

# Compila assets
bundle exec rails assets:precompile