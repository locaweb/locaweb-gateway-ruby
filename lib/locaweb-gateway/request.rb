module Locaweb
  module Gateway
    class Request
      attr_reader :engine, :action
      delegate :base_uri, :to => Locaweb::Gateway::Config

      def initialize(options={})
        @action = options[:action]
        @engine = RestClient
      end

      def request_uri
        "#{base_uri}#{action}"
      end

      def post(params)
        http_request(:method => :post, :params => params.to_json)
      end

      def get(params)
        http_request(:method => :get, :params => { :params => params })
      end

      private

      def http_request(options={})
        logger.info("Sending to Gateway API. URI: #{request_uri}.\nRequest Params: #{options[:params]}")
        response = begin
          engine.send(options[:method], request_uri, options[:params])
        rescue RestClient::Exception => bad_request
          OpenStruct.new(:body => bad_request.http_body, :to_i => bad_request.http_code)
        end
        logger.info("Response Status: #{response.to_i}. Response Body: #{response.body.to_s}")

        response
      end

      def logger
        ::Locaweb::Gateway::Config.logger
      end
    end
  end
end
