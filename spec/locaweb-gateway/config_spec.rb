require 'spec_helper'

module Locaweb
  module Gateway
    describe Config do
      describe ".token" do
        it "should return an empty string if dont pass a token" do
          Config.token.should == ''
        end
      end

      describe ".environment" do
        it "should have production as default" do
          Config.environment.should be :production
        end
      end

      describe ".uri" do
        it "should be possible to have an acessor to overwrite" do
          Config.uri.should be_empty
        end
      end

      describe ".base_uri" do
        it "should return the uri if is present" do
          Config.stub(:uri).and_return("https://api-lw.gatewaylocaweb.com.br")
          Config.base_uri.should == "https://api-lw.gatewaylocaweb.com.br"
        end

        it "should return the production base uri" do
          Config.stub(:environment).and_return(:production)
          Config.base_uri.should == 'https://api.gatewaylocaweb.com.br/v1/transacao'
        end

        it "should return the sandbox base uri" do
          Config.stub(:environment).and_return(:sandbox)
          Config.base_uri.should == 'https://api-sandbox.gatewaylocaweb.com.br/v1/transacao'
        end
      end
    end
  end
end