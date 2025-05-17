#!/bin/bash
set -o errexit

# 1. Encerra conexões existentes
rails db -e production <<EOF
  UPDATE pg_database SET datallowconn = 'false' WHERE datname = 'todo_v360_vf6j';
  SELECT pg_terminate_backend(pg_stat_activity.pid)
  FROM pg_stat_activity
  WHERE pg_stat_activity.datname = 'todo_v360_vf6j';
EOF

# 2. Recria o banco
rails db:drop db:create db:migrate

# 3. Compila assets
rails assets:precompile