# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'vcr/cassettes'
  c.ignore_localhost = true
end
