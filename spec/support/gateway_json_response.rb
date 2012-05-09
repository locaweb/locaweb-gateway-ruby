# encoding: utf-8
module GatewayJSONResponse
  def invalid_credentials
    "{\"transacao\":{\"erro\":{\"codigo\":\"001\",\"mensagem\":\"Credenciais inválidas\"}}}"
  end

  def transaction_not_found
    "{\"transacao\":{\"erro\":{\"codigo\":\"006\",\"mensagem\":\"Recurso não encontrado\"}}}"
  end

  def payment_way_not_valid
     "{\"transacao\":{\"erro\":{\"codigo\":\"004\",\"mensagem\":\"Meio de pagamento não é válido\"}}}"
  end

  def cielo_success_response
    {
      "transacao" => {
        "id" => "152",
        "status" => "pago",
        "url_acesso" => "http://api.gatewaylocaweb.com.br/v1/transacao/foobar",
        "meio_pagamento" => "cielo",
        "numero_pedido" => "876",
        "erro" => nil,
        "detalhes" => {
          "tid" => "10017",
          "nsu" => "998877",
          "pan" => "887766",
          "arp" => "776655",
          "lr"  => nil
        }
      }
    }.to_json
  end

  def itau_shopline_success_response
    {
      "transacao" => {
        "id" => "159",
        "status" => "aguardando pagamento",
        "meio_pagamento" => "itau_shopline",
        "numero_pedido" => "654",
        "url_acesso" => "https://api-gateway.devintegration.locaweb.com.br/v1/itau_shopline/fd350d45-0b26-4dcf-8455-3f755bd71826",
        "erro" => nil,
        "detalhes" => {
          "nsu" => nil,
          "tipo_pagamento" => nil,
          "data_pagamento" => nil,
          "numero_autorizacao" => nil,
          "tipo_cartao" => nil
        }
      }
    }.to_json
  end
end