def set_route(controller, action)
  if action.is_a? String
    action = action.to_sym
  end

  controller.new(params: params, request: request).call(action)
end

get '/calculators' do
  content_type :json
  set_route(CalculatorsController, :show)
end