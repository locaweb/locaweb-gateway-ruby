# Locaweb Gateway

## Install

    gem install locaweb-gateway

## Usage

    Locaweb::Gateway.configure do |config|
      config.token = '3a5bbed0-50d4-012f-8d73-0026bb5a6240'
      config.environment = 'sandbox' # se não for passado irá utilizar production por default.
    end

    transaction = Locaweb::Gateway.criar(
      :url_retorno => 'http://foo.com/url_retorno',
      :capturar => true,
      :pedido => {
        :numero => "989012",
        :total => "100.00",
        :moeda => :real,
        :descricao => "cylon toaster!"
      },
      :pagamento => {
        :meio_pagamento => :cielo,
        :bandeira => :visa,
        :numero_cartao => "4012001037141112",
        :cartao_codigo_verificacao => "973",
        :parcelas => "1",
        :tipo_operacao => "credito_a_vista",
        :vencimento_cartao => "082015"
      },
      :comprador => {
        :nome => "Bruna da Silva",
        :documento => "12345678900",
        :endereco => "Rua da Casa",
        :numero => "23",
        :cep => "09710240",
        :bairro => "Centro",
        :cidade => "São Paulo",
        :estado => "SP"
      }
    )
    Locaweb::Gateway.consultar(transaction.id)
    Locaweb::Gateway.cancelar(transaction.id)
    Locaweb::Gateway.capturar(transaction.id)

## Docs

[Documentação do Gateway de Pagamentos Locaweb](http://docs.gatewaylocaweb.com.br)
