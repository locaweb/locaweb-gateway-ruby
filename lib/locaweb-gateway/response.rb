module Locaweb
  module Gateway
    class Response
      attr_reader :raw_response, :body, :http_status

      def initialize(raw_response)
        @raw_response = raw_response
        @body = JSON.parse(raw_response.body.to_s)
        @http_status = raw_response.to_i
      end

      def parse
        transaction = Locaweb::Gateway::Transaction.new
        transaction.response = self
        transaction_node = @body['transacao'] || {}
        error_node = transaction_node['erro'] || {}

        transaction.id             = transaction_node['id']
        transaction.status         = transaction_node['status']
        transaction.url_acesso     = transaction_node['url_acesso']
        transaction.meio_pagamento = transaction_node['meio_pagamento']
        transaction.numero_pedido  = transaction_node['numero_pedido']
        transaction.detalhes       = transaction_node['detalhes']
        transaction.erro           = error_node.symbolize_keys
        transaction.erro_codigo    = error_node['codigo']
        transaction.erro_mensagem  = error_node['mensagem']

        transaction
      end
    end
  end
end