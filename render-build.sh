#!/bin/bash
set -o errexit

# Instala dependências
bundle install
npm install

# Build dos assets
npm run build:css
rails assets:precompile

# Migrações
rails db:migrate