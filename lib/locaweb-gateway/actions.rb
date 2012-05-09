module Locaweb
  module Gateway
    module Actions
      def create(params)
        request  = ::Locaweb::Gateway::Request.new(:action => "/")
        Response.new(request.post(gateway_params(params))).parse
      end
      alias :criar :create

      def cancel(id)
        request  = ::Locaweb::Gateway::Request.new(:action => "/#{id}/estornar")
        Response.new(request.post(gateway_params)).parse
      end
      alias :cancelar :cancel

      def capture(id)
        request  = ::Locaweb::Gateway::Request.new(:action => "/#{id}/capturar")
        Response.new(request.post(gateway_params)).parse
      end
      alias :capturar :capture

      def show(id)
        request  = ::Locaweb::Gateway::Request.new(:action => "/#{id}")
        Response.new(request.get(gateway_params)).parse
      end
      alias :consultar :show

      def gateway_params(params={})
        attributes = params.empty? ? {} :  { :transacao => params }
        attributes.merge(:token => Locaweb::Gateway::Config.token)
      end
    end
  end
end