require './application'

run Rack::URLMap.new('/' => Calc::Application, '/sidekiq' => Sidekiq::Web)