#helpers
Dir['./app/helpers/*.rb'].each do |file|
  require file
end

#uploaders
Dir['./app/uploaders/*.rb'].each do |file|
  require file
end

# models
base_model = './app/models/base.rb'
require base_model


Dir['./app/models/*.rb'].each do |file|
  require file
end

# controllers
base_controller = './app/controllers/base_controller.rb'
app_controller = './app/controllers/application_controller.rb'
require base_controller
require app_controller

Dir['./app/controllers/*.rb'].each do |file|
  require file
end



