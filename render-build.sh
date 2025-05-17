#!/bin/bash
set -o errexit

# 1. Instala dependências
bundle install

# 2. Recria o banco com TODAS as migrações (incluindo a criação da tabela lists)
rails db:drop db:create db:migrate

# 3. Compila assets
rails assets:precompile