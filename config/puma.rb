# Puma configuration file
workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))  # Render funciona melhor com 2 workers no plano free
max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count)
threads min_threads_count, max_threads_count

preload_app!  #  importante para o Render

worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

port ENV.fetch("PORT", 3000)
environment ENV.fetch("RAILS_ENV", "production")  # Force production no Render

pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")
plugin :tmp_restart

# Configurações específicas para o Render
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

lowlevel_error_handler do |e|
  [500, {}, ["An error has occurred and the engineers have been informed. Please reload the page. If you continue to have problems, contact support.\n"]]
end