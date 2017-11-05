require 'pry'
require 'net/http'
require 'nokogiri'

require_relative 'sesc/crawler'
require_relative 'sesc/parser/events'
require_relative 'sesc/parser/body'

module Sesc
  class << self
    def events
      Sesc::Parser::Events.new(html_response).to_hash
    end

    private

    def html_response
      Sesc::Crawler.get
    end
  end
end

Sesc.events
