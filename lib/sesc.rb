require 'pry'
require 'net/http'
require 'nokogiri'

require_relative 'sesc/crawler'
require_relative 'sesc/parser/events'
require_relative 'sesc/parser/body'
require_relative 'sesc/exporter/term'

module Sesc
  class << self
    def print_on_terminal
      Sesc::Exporter::Term.print(events)
    end

    private

    def events
      Sesc::Parser::Events.new(html_response).to_hash
    end

    def html_response
      Sesc::Crawler.get
    end
  end
end

Sesc.print_on_terminal
