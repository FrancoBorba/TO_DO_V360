#!/bin/bash
set -o errexit

bundle install
rails assets:precompile
rails db:migrate