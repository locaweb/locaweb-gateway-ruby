require 'locaweb-gateway/actions'

module Locaweb
  module Gateway
    class Transaction
      extend ::Locaweb::Gateway::Actions

      attr_accessor :response, :id, :status, :url_acesso, :meio_pagamento, :numero_pedido, :detalhes
      attr_accessor :erro, :erro_codigo, :erro_mensagem

      def initialize
        @detalhes = {}
      end
    end
  end
end
