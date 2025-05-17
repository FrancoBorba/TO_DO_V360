#!/bin/bash
set -o errexit

bundle install
rails tailwindcss:build
rails assets:precompile
rails db:migrate