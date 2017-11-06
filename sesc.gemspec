# -*- encoding: utf-8 -*-

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'sesc/version'
require 'English'

Gem::Specification.new do |s|
  s.name        = 'sesc'
  s.version     = Sesc::Version::STRING
  s.date        = '2017-11-05'
  s.summary     = 'Sesc API'
  s.description = 'A simple wrap to list events of SESC'
  s.authors     = ['fernandopso']
  s.email       = 'fernandopso@bsi.ufla.br'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/fernandopso/sesc'

  s.executables << 'sesc'

  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |\.rspec
    |\.gitignore
    )$}x
  end

  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency('nokogiri', '~> 1.8.0', '>= 1.8.0')
end
