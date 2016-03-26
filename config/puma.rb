workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup		DefaultRackup
port		ENV['PORT'] 	||	3000
environment	ENV['RACK_ENV']	|| 'production'

on_worker_boot do
	# Worker specific setup for rails 4.1+
	# See heroku docs

	ActiveRecord::Base.establish_connection
end