# Locaweb Gateway

## Instalação

    gem install locaweb-gateway

## Environment e token

O Gateway da Locaweb possui a sua forma de autenticação e dois ambientes para processamento das transações: o ambiente de produção e o ambiente de testes(sandbox).
Para se autenticar e passar o ambiente:

```ruby
   require 'locaweb-gateway'
   Locaweb::Gateway.configure do |config|
     config.token = '3a5bbed0-50d4-012f-8d73-0026bb5a6240'
     config.environment = 'sandbox' # se não for passado irá utilizar production por default.
   end
```

## Criar Transação

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

## Consultar Transação

Imagine que você quer consultar a transação criada acima, basta fazer isso:

```ruby
  Locaweb::Gateway.consultar(transacao.id)
```

# Capturar Transação

Se você passou a flag de "capturar" como false no exemplo acima, você precisará capturar em algum momento. Para isso, basta fazer:

```ruby
Locaweb::Gateway.capturar(transacao.id)
```

# Cancelar Transação

Caso queira estornar/cancelar a transação criada acima, basta fazer:

```ruby
Locaweb::Gateway.cancelar(transacao.id)
```

## Documentação

[Documentação do Gateway de Pagamentos Locaweb](http://docs.gatewaylocaweb.com.br)
