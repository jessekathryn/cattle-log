ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "cattlelog_dev"
)

require_all 'app' 