#!/bin/bash
set -o errexit

# Instala dependências
bundle install

# Executa migrações do banco de dados
bundle exec rails db:migrate

# Compila assets para produção
bundle exec rails assets:precompile