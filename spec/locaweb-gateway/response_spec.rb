# encoding: utf-8
require 'spec_helper'

module Locaweb
  module Gateway
    describe Response do
      describe "#parse" do
        context 'on invalid credentital' do
          subject { Response.new(ResponseFixture.new(:body => invalid_credentials, :status => 403)) }

          it "should parse the transaction in error node with code and message" do
            transaction = subject.parse
            transaction.erro.should == { :codigo => '001', :mensagem => 'Credenciais inválidas' }
            transaction.erro_codigo.should == '001'
            transaction.erro_mensagem.should == 'Credenciais inválidas'
          end
        end

        context 'on transaction not found' do
          subject { Response.new(ResponseFixture.new(:body => transaction_not_found, :status => 404))}

          it "should parse the transaction in error node with code and message" do
            transaction = subject.parse
            transaction.erro.should == { :codigo => '006', :mensagem => 'Recurso não encontrado' }
            transaction.erro_codigo.should == '006'
            transaction.erro_mensagem.should == 'Recurso não encontrado'
          end
        end

        context 'on cielo success response' do
          subject { Response.new(ResponseFixture.new(:body => cielo_success_response, :status => 201))}

          it "should parse the transaction and return the id, status, url_acesso and meio_pagamento" do
            transaction = subject.parse
            transaction.id.should == '152'
            transaction.status.should == 'pago'
            transaction.url_acesso.should == 'http://api.gplw.com.br/v1/transacao/foobar'
            transaction.meio_pagamento.should == 'cielo'
            transaction.numero_pedido.should == '876'
            transaction.detalhes.should == { "tid" => "10017", "nsu" => "998877", "pan" => "887766", "arp" => "776655", "lr"  => nil }
          end
        end

        context 'on itau shopline success response' do
          subject { Response.new(ResponseFixture.new(:body => itau_shopline_success_response, :status => 201))}

          it "should parse the transaction and return the id, status, meio_pagamento, url_acesso and detalhes" do
            transaction = subject.parse
            transaction.id.should == '159'
            transaction.status.should == 'aguardando pagamento'
            transaction.url_acesso.should == 'https://api-gateway.devintegration.locaweb.com.br/v1/itau_shopline/fd350d45-0b26-4dcf-8455-3f755bd71826'
            transaction.numero_pedido.should == '654'
            transaction.detalhes.should == { "nsu" => nil, "tipo_pagamento" => nil, "data_pagamento" => nil, "numero_autorizacao" => nil, "tipo_cartao" => nil }
          end
        end
      end
    end
  end
end