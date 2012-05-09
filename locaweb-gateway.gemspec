# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "locaweb-gateway/version"

Gem::Specification.new do |s|
  s.name        = "locaweb-gateway"
  s.version     = Locaweb::Gateway::VERSION
  s.authors     = ["Locaweb - Saas"]
  s.email       = ["atendimento@locaweb.com.br"]
  s.homepage    = "http://github.com/locaweb/locaweb-gateway"
  s.summary     = %q{Locaweb Payment Gateway Gem}
  s.description = %q{This gem was designed to help you to access the locaweb payment gateway.}

  s.rubyforge_project = "locaweb-gateway"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rest-client'
  s.add_dependency 'activesupport'
  s.add_dependency 'json'

  s.add_development_dependency 'rspec'
end
