require 'rest-client'
require 'active_support/core_ext/class'
require 'active_support/core_ext/object'
require 'ostruct'
require 'locaweb-gateway/actions'
require 'locaweb-gateway/config'
require 'locaweb-gateway/transaction'
require 'locaweb-gateway/request'
require 'locaweb-gateway/response'

module Locaweb
  module Gateway
    extend Locaweb::Gateway::Actions

    def self.configure(&block)
      Locaweb::Gateway::Config.configure(&block)
    end
  end
end
