app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Specify environment
environment ENV.fetch("RAILS_ENV") { "production" }

# Set up socket location for Nginx to forward to
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

# Change to match your CPU core count
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Threads per worker
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Preload the application before starting workers (to save memory)
preload_app!

# Plugin
plugin :tmp_restart

on_worker_boot do
  # Valid on Rails 4.1+ using the `config/database.yml` method of setting `pool` size
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
