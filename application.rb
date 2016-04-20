module Calc
  class Application < Sinatra::Application

    register Sinatra::Initializers

    def set_route(controller, action)
      if action.is_a? String
        action = action.to_sym
      end

      controller.new(params: params, request: request).call(action)
    end

    get '/calculators' do
      p 111, ENV['MONGO_HOST']
      content_type :json
      set_route(CalculatorsController, :show)
    end

    get '/all' do
      content_type :json
      set_route(CalculatorsController, :index)
    end

    post '/images' do
      content_type :json
      set_route(ImagesController, :create)
    end

    get '/images' do
      content_type :json
      set_route(ImagesController, :index)
    end

    get '/images/:id' do
      content_type :json
      set_route(ImagesController, :show)
    end

    delete '/images' do
      content_type :json
      set_route(ImagesController, :destroy)
    end
  end
end

