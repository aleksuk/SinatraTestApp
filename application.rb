require './loader'

Calc::AutoLoader.load

module Calc
  class Application < Sinatra::Application

    register Sinatra::Initializers

    def set_route(controller, action, type = :json)
      content_type type

      action = action.to_sym if action.is_a? String

      controller.new(self).call(action)
    end

    post '/calculators' do
      set_route(CalculatorsController, :create)
    end

    delete '/calculators/:id' do
      set_route(CalculatorsController, :destroy)
    end

    get '/calculators' do
      set_route(CalculatorsController, :index)
    end

    get '/calculators/:id' do
      set_route(CalculatorsController, :index)
    end

    post '/images' do
      set_route(ImagesController, :create)
    end

    get '/images' do
      set_route(ImagesController, :index)
    end

    get '/images/:id' do
      set_route(ImagesController, :show)
    end

    delete '/images/:id' do
      set_route(ImagesController, :destroy)
    end
  end
end