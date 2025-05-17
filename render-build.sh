#!/bin/bash
set -o errexit

# Configuração do ambiente
export RAILS_ENV=production
export BUNDLE_PATH=vendor/bundle

# Instala dependências
bundle install

# Recria o banco e aplica TODAS as migrações
bundle exec rails db:drop db:create db:migrate

# Compila assets
bundle exec rails assets:precompile