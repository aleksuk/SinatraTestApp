CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.root = File.join(Dir.pwd, 'public/')
  config.asset_host = ENV['ASSETS_HOST']
end