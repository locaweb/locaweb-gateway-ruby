require 'spec_helper'

module Locaweb
  module Gateway
    describe Request do
      subject { Request.new(:action => '/') }

      describe "#action" do
        it "should read the action instance variable" do
          subject.action.should == '/'
        end
      end

      describe "#request_uri" do
        subject { Request.new(:action => '/foo') }

        it "should join the base endpoint with the requested action" do
          subject.stub(:base_uri).and_return('https://api.gatewaylocaweb.com.br/v1/transacao')
          subject.request_uri.should == 'https://api.gatewaylocaweb.com.br/v1/transacao/foo'
        end
      end

      describe "#engine" do
        it "should have RestClient as default" do
          subject.engine.should be RestClient
        end
      end

      describe "#post" do
        it "should pass post to the base endpoint and return the response" do
          subject.engine.should_receive(:post).with(subject.request_uri, "{\"foo\":\"bar\"}").and_return(ResponseFixture.new(:body => invalid_credentials, :status => 403))
          subject.post(:foo => :bar)
        end

        it "should not raise an exception when rest raise exception" do
          subject.engine.should_receive(:post).and_raise(RestClient::ResourceNotFound)
          expect { subject.post(:foo => :bar) }.to_not raise_error
        end
      end

      describe "#get" do
        it "should pass the get to the engine and return an response" do
          subject.engine.should_receive(:get).with(subject.request_uri, { :params => { :foo => :bar }}).and_return(ResponseFixture.new(:body => invalid_credentials, :status => 403))
          subject.get(:foo => :bar)
        end

        it "should not raise an exception when the engine raise exception" do
          subject.engine.should_receive(:get).and_raise(RestClient::ResourceNotFound)
          expect { subject.get(:foo => :bar) }.to_not raise_error
        end
      end
    end
  end
end
