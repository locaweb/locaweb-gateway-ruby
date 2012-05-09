require "locaweb-gateway"

Dir['spec/support/*.rb'].each { |file| require File.expand_path(file) }

RSpec.configure do |config|
  config.include GatewayJSONResponse
end
