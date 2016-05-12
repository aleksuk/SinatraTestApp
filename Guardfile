guard 'rack' do
  watch('Gemfile.lock')
  watch('application.rb')
  watch(%r{^(config|app|api)/.*})
end

### Guard::Sidekiq
#  available options:
#  - :verbose
#  - :queue (defaults to "default") can be an array
#  - :concurrency (defaults to 1)
#  - :timeout
#  - :environment (corresponds to RAILS_ENV for the Sidekiq worker)
guard 'sidekiq', require: './application.rb' do
  watch('Gemfile.lock')
  watch('application.rb')
  watch(%r{^(config|app|api)/.*})
end