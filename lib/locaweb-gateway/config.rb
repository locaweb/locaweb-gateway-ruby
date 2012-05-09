module Locaweb
  module Gateway
    class Config
      # The class variable that represents the user token.
      #
      cattr_accessor :token
      self.token = ''

      # The class variable that represents the environment that the transaction will be processed
      # <b>OBS.:</b>: Defaults to production
      #
      cattr_accessor :environment
      self.environment = :production

      # TODO: put ssl and the request object should read from this.
      #
      # cattr_accessor :ssl, :ssl_client_cert, :ssl_client_key, :ssl_ca_file
      # self.ssl = false
      #

      # Returns the base endpoint for the Locaweb Payment Gateway.
      #
      def self.base_uri
        if environment.equal?(:production)
          'https://api.gplw.com.br/v1/transacao'
        else
          'https://api-sandbox.gplw.com.br/v1/transacao'
        end
      end

      def self.configure(&block)
        block.call(self)
      end
    end
  end
end
