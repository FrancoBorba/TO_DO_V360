#!/bin/bash
set -o errexit

# Instala dependências
bundle install

# Garante que as migrações rodem
rails db:migrate || rails db:create db:migrate

# Compila assets
rails assets:precompile