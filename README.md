# Gateway de Pagamento da Locaweb

http://www.locaweb.com.br/produtos/gateway-pagamento.html

## Instalação

    gem install locaweb-gateway

## Autenticação, configuração do token e ambientes

Para utilizar o Gateway de Pagamento da Locaweb, você precisa se autenticar e configurar o token de acesso.
Atenção: existem dois ambientes de processamento das transações: o ambiente de produção e o ambiente de testes (sandbox).
Para se autenticar, configurar o token e informar o ambiente, copie o modelo a seguir:

```ruby
   require 'locaweb-gateway'
   Locaweb::Gateway.configure do |config|
     config.token       = '3a5bbed0-50d4-012f-8d73-0026bb5a6240'
     config.environment = 'sandbox' # Se não for informado, o ambiente "production" é o default e será utilizado
     config.logger      = Rails.logger # Se nenhum logger for informado, nada será logado
   end
```

## Criação de uma transação

A Transação é a entidade básica do gateway e representa a transação em que seu cliente efetua um pagamento a sua loja. Para criar uma transação, basta fazer:

```ruby
transacao = Locaweb::Gateway.criar(
  :url_retorno => 'http://foo.com/url_retorno',
  :capturar => true,
  :pedido => {
    :numero => "989012",
    :total => "100.00",
    :moeda => :real,
    :descricao => "Camisa de Futebol"
  },
  :pagamento => {
    :meio_pagamento => :cielo,
    :bandeira => :visa,
    :cartao_numero => "4012001037141112",
    :cartao_cvv => "973",
    :cartao_validade => "082015",
    :parcelas => "1",
    :tipo_operacao => "credito_a_vista"
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
```

## Consulta de uma transação

Para consultar a transação acima criada, basta executar:

```ruby
  Locaweb::Gateway.consultar(transacao.id)
```

# Captura de uma transação

Se você passou a flag de "capturar" como false no exemplo acima, você precisará capturar em algum momento. Para isso, basta executar:

```ruby
Locaweb::Gateway.capturar(transacao.id)
```

# Cancelamento de uma transação

Caso queira estornar / cancelar a transação acima criada, basta executar:

```ruby
Locaweb::Gateway.cancelar(transacao.id)
```

## Documentação completa

[Documentação completa do Gateway de Pagamento da Locaweb](http://docs.gatewaylocaweb.com.br)
